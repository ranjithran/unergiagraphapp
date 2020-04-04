import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:unergiagraphapp/Notifers/ActivityNotifer.dart';
import 'package:unergiagraphapp/Notifers/FirebaseDataRetriver.dart';
import 'package:unergiagraphapp/Notifers/PiechartNotifer.dart';

class Ranchart extends StatelessWidget {
  final double width = 7;
  List<BarChartGroupData> showingBarGroups = new List<BarChartGroupData>();
  List _fake = new List();
  int _i = 0;
  int _cal = 0;
  double i = 0, j = 0, h = 0;
  final List _list = [
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thus",
    "fir",
    "Sat",
  ];

  Ranchart() {
    showingBarGroups = [
      makeGroupData(0, 40),
      makeGroupData(1, 50),
      makeGroupData(2, 60),
      makeGroupData(3, 70),
      makeGroupData(4, 80),
      makeGroupData(5, 90),
      makeGroupData(6, 100),
      makeGroupData(7, 120),
      makeGroupData(8, 180),
      makeGroupData(9, 140),
      makeGroupData(10, 90),
      makeGroupData(11, 80),
      makeGroupData(12, 70),
      makeGroupData(13, 60),
      makeGroupData(14, 50),
      makeGroupData(15, 40),
      makeGroupData(16, 100),
      makeGroupData(17, 120),
      makeGroupData(18, 130),
      makeGroupData(19, 140),
      makeGroupData(20, 180),
      makeGroupData(14, 160),
      makeGroupData(15, 120),
      makeGroupData(16, 60),
      makeGroupData(17, 50),
      makeGroupData(18, 40),
    ];
    print("making list");
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.only(top: 10),

      child: Consumer2<ActivityNotifier, FirebaseNotfier>(
          builder: (context, _, _1, child) {
        PageController _con = new PageController(initialPage: 0);
        print("2");
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: _.status
                  ? [Color(0xFF51DE93), Color(0xFFFFB540), Color(0xFFFA4169)]
                  : [
                      Color(0xFF1CB5E0),
                      // Color(0xFF083371),
                      Color(0xFF000033),
                    ],
              stops: _.status
                  ? [
                      0.0,
                      0.5,
                      1.0,
                    ]
                  : [
                      0.0,
                      // 0.5,
                      2,
                    ],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: PageView(
            controller: _con,
            onPageChanged: (value) {
              if (value == 1) {
                Provider.of<ActivityNotifier>(context, listen: false)
                    .setBusy(false);
              } else if (value == 0) {
                Provider.of<ActivityNotifier>(context, listen: false)
                    .setBusy(true);
              }
            },
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: FutureBuilder(
                    future: Firestore.instance.collection("Data").getDocuments(),
                    builder: (context, snapshot) {
                  _fake.clear();
                  i = 0;
                  j = 0;
                  h = 0;
                  _cal = 0;
                  if (!snapshot.hasData) {
                    return BarChart(
                        BarChartData(
                            barTouchData: BarTouchData(enabled: false),
                            titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: SideTitles(
                                  showTitles: true,
                                  margin: 0,
                                  textStyle: TextStyle(
                                      color: const Color(0xff7589a2),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                  getTitles: (double value) {
                                    switch (value.toInt()) {
                                      case 1:
                                        return '00:00';
                                      case 13:
                                        return '12:00';
                                      case 24:
                                        return '00:00';

                                      default:
                                        return '';
                                    }
                                  },
                                ),
                                leftTitles: SideTitles(showTitles: false)),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            barGroups: showingBarGroups,
                            groupsSpace: 15),
                        swapAnimationDuration: Duration(seconds: 2));
                  } else {
                    print("Getting data");
                    showingBarGroups.clear();
                    try {
                      snapshot.data.documents
                          .forEach((f) => _fake.add(f.data[_1.key].toList()));

                      _fake[0].forEach((f) {
                        _cal = int.parse(f["Calories"].toString()) + _cal;
                        if (f["Time"] == "12:00:00") {
                          i = double.parse(_cal.toString());
                        } else if (f["Time"] == "23:00:00") {
                          j = double.parse(_cal.toString());
                        } else {
                          h = double.parse(_cal.toString());
                        }
                        showingBarGroups.add(
                          makeGroupData(
                            _i++,
                            double.parse(
                              f["Calories"].toString(),
                            ),
                          ),
                        );
                      });
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Provider.of<PiechartNotifir>(context, listen: false)
                            .setChartvalue([i, j, h], _cal);
                      });
                      return BarChart(
                          BarChartData(
                              barTouchData: BarTouchData(enabled: false),
                              titlesData: FlTitlesData(
                                  show: true,
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    margin: 0,
                                    textStyle: TextStyle(
                                        color: const Color(0xff7589a2),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                    getTitles: (double value) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return '00:00';
                                        case 12:
                                          return '12:00';

                                        case 23:
                                          return '00:00';

                                        default:
                                          return '';
                                      }
                                    },
                                  ),
                                  leftTitles: SideTitles(showTitles: false)),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              barGroups: showingBarGroups,
                              groupsSpace: 16),
                          swapAnimationDuration: Duration(milliseconds: 500));
                    } catch (e) {
                      return Center(child: Text("Error occured"));
                    }
                  }
                }),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: FutureBuilder(
                    future: Firestore.instance.collection("Data").getDocuments(),
                    builder: (context, snapshot) {
                  _fake.clear();
                  i = 0;
                  j = 0;
                  h = 0;
                  _cal = 0;
                  if (!snapshot.hasData) {
                    return BarChart(
                        BarChartData(
                            barTouchData: BarTouchData(enabled: false),
                            titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: SideTitles(
                                  showTitles: true,
                                  margin: 0,
                                  textStyle: TextStyle(
                                      color: const Color(0xff7589a2),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                  getTitles: (double value) {
                                    switch (value.toInt()) {
                                      case 1:
                                        return '00:00';
                                      case 13:
                                        return '12:00';
                                      case 24:
                                        return '00:00';

                                      default:
                                        return '';
                                    }
                                  },
                                ),
                                leftTitles: SideTitles(showTitles: false)),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            barGroups: showingBarGroups,
                            groupsSpace: 15),
                        swapAnimationDuration: Duration(seconds: 2));
                  } else {
                    print("Rest Getting data");
                    showingBarGroups.clear();
                    try {
                      snapshot.data.documents.forEach((f) => _fake
                          .add(f.data[_list[Random().nextInt(6)]].toList()));

                      _fake[0].forEach((f) {
                        _cal = int.parse(f["Calories"].toString()) + _cal;
                        if (f["Time"] == "12:00:00") {
                          i = double.parse(_cal.toString());
                        } else if (f["Time"] == "23:00:00") {
                          j = double.parse(_cal.toString());
                        } else {
                          h = double.parse(_cal.toString());
                        }
                        showingBarGroups.add(
                          makeGroupData(
                            _i++,
                            double.parse(
                              f["Calories"].toString(),
                            ),
                          ),
                        );
                      });
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Provider.of<PiechartNotifir>(context, listen: false)
                            .setChartvalue([i, j, h], _cal);
                      });
                      return BarChart(
                          BarChartData(
                              barTouchData: BarTouchData(enabled: false),
                              titlesData: FlTitlesData(
                                  show: true,
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    margin: 0,
                                    textStyle: TextStyle(
                                        color: const Color(0xff7589a2),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                    getTitles: (double value) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return '00:00';
                                        case 12:
                                          return '12:00';

                                        case 23:
                                          return '00:00';

                                        default:
                                          return '';
                                      }
                                    },
                                  ),
                                  leftTitles: SideTitles(showTitles: false)),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              barGroups: showingBarGroups,
                              groupsSpace: 16),
                          swapAnimationDuration: Duration(milliseconds: 500));
                    } catch (e) {
                      return Center(child: Text("Error occured"));
                    }
                  }
                }),
              ),
            ],
          ),
        );
      }),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        width: width,
      ),
    ]);
  }
}
