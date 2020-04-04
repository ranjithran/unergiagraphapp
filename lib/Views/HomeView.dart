import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:unergiagraphapp/Widgets/Activty.dart';
import 'package:unergiagraphapp/Widgets/BottomNaviagationbar.dart';
import 'package:unergiagraphapp/Widgets/Piechart.dart';
import 'package:unergiagraphapp/Widgets/Ranchart1.dart';
import 'package:unergiagraphapp/Widgets/Title.dart';
import 'package:unergiagraphapp/Widgets/Twoicons.dart';

class Homeview extends StatelessWidget {
  
  final icon = Icon(CommunityMaterialIcons.account);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Icon(
              CommunityMaterialIcons.restart,
              color: Colors.black,
            ),
            SizedBox(width: ScreenUtil().setWidth(15),)
          ],
          leading: menuIcon,
          elevation: 1,
          backgroundColor: Colors.white,
          title: MyTitle(
            title: "DATA",
          ),
        ),
        body: Card(
          elevation: 2,
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Expanded(flex: 0, child: Activity()),
                Expanded(flex: 3, child: Ranchart()),
                Expanded(
                  flex: 0,
                  child: Container(
                    height: ScreenUtil().setHeight(80),
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        border: Border(
                      bottom: BorderSide(width: 0.2),
                      top: BorderSide(width: 0.2),
                    )),
                    child: Center(
                      child: TwoIcons(),
                    ),
                  ),
                ),
                Expanded(flex: 2, child: PieChaartwithcal()),
                Expanded(flex: 0,child: BottomNavigation())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menuIcon = new Container(
    margin: EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          height: 3.5,
          width: 14,
          margin: EdgeInsets.only(left: 8),
        ),
        SizedBox(
          height: 2.5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          height: 3.5,
          width: 25,
        ),
        SizedBox(
          height: 2.5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          height: 3.5,
          width: 14,
          margin: EdgeInsets.only(right: 8),
        ),
      ],
    ),
  );
}
