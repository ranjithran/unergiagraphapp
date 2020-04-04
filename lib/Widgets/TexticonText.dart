import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unergiagraphapp/Notifers/PiechartNotifer.dart';

class TextIconText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.2),
                left: BorderSide(width: 0.2),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Consumer<PiechartNotifir>(
                            builder: (context, _value, child) => Text(
                              "${_value.cla ?? "0"} kcal",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(65),
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Calories",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(45),
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(CommunityMaterialIcons.arrow_right),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                border: Border(
              left: BorderSide(width: 0.2),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Consumer<PiechartNotifir>(
                            builder: (context, _value, child) => Text(
                              "${_value.cla > 1000 ? _value.cla > 1200 ? _value.cla > 1400 ? _value.cla > 1600 ? _value.cla>1900?"100":"90" : "80" : "60" : "40" : "30"} ranking",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(60),
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Score",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(45),
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(CommunityMaterialIcons.arrow_right),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
