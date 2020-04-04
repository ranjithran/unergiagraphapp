import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unergiagraphapp/Notifers/ActivityNotifer.dart';
import 'package:unergiagraphapp/Notifers/PiechartNotifer.dart';

class Ranchart2 extends StatelessWidget {
  final double radius = 15;
  @override
  Widget build(BuildContext context) {
    return
    Consumer2<PiechartNotifir,ActivityNotifier>(
            builder: (context, value, _,child) =>
     Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(380),
          child: 
             PieChart(
              PieChartData(
                sections:_.status? List.generate(3, (i) {
                  switch (i) {
                    case 0:
                      return PieChartSectionData(
                        color: Color(0xFFfb4d65),
                        value: value.chartvalues[0],
                        title: '',
                        radius: radius,
                      );
                    case 1:
                      return PieChartSectionData(
                        color: Color(0xFFfd8950),
                        value: value.chartvalues[1],
                        title: '',
                        radius: radius,
                      );
                    case 2:
                      return PieChartSectionData(
                        color: Color(0xFFffb042),
                        value: value.chartvalues[2],
                        title: '',
                        radius: radius,
                      );
                    default:
                      return null;
                  }
                }):List.generate(2, (i) {
                  switch (i) {
                    case 0:
                      return PieChartSectionData(
                        color: Color(0xFF0e5d95),
                        value: value.chartvalues[0],
                        title: '',
                        radius: radius,
                      );
                    case 1:
                      return PieChartSectionData(
                        color: Color(0xFF000033),
                        value: value.chartvalues[1],
                        title: '',
                        radius: radius,
                      );
                    default:
                      return null;
                  }
                }),
                sectionsSpace: 0,
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
        
        Text(_.status?"24 hrs":"8 hrs",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(50),
              fontWeight: FontWeight.w500,
            )),
      ],
    ),);
  }
}
