import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unergiagraphapp/Notifers/ActivityNotifer.dart';
import 'package:unergiagraphapp/Widgets/Dot.dart';

class Activity extends StatelessWidget {
  const Activity({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Consumer<ActivityNotifier>(
            builder: (context,_,child)=>
                      Container(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _.status?
                      "ACTIVITY":"REST",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(50),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(30),
                  ),
                  Expanded(
                    flex: 0,
                    child: Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center
                        children: <Widget>[
                          DotIcon(
                            
                            text:_.status? "High":"Deep",
                            color:_.status? Color(0xFFfb4d65):Color(0xFF000046),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(30),
                          ),
                          DotIcon(
                            color: _.status?Color(0xFFfd8950):Color(0xFF1CB5E0),
                            text: _.status?"Moderate":"Light",
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(30),
                          ),
                          _.status?DotIcon(
                            color: Color(0xFFffb042),
                            text: "Light",
                          ):SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
    );
  }
}

class DotIcon extends StatelessWidget {
  final String text;
  final Color color;
  const DotIcon({Key key, this.text, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Dot(
            color: color,
          ),
          SizedBox(
            width: ScreenUtil().setWidth(25),
          ),
          Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: ScreenUtil().setSp(45)),
          ),
        ],
      ),
    );
  }
}
