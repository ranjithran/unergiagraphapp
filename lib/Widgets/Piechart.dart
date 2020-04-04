import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unergiagraphapp/Widgets/RanChart2.dart';
import 'package:unergiagraphapp/Widgets/TexticonText.dart';

class PieChaartwithcal extends StatelessWidget {
  const PieChaartwithcal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.2
          )
        )
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Ranchart2(),
              height: 200,
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(20),
          ),
          Expanded(
              flex: 2,
              child: Container(
                  
                  alignment: Alignment.center,
                  // color: Colors.amber,
                  child: TextIconText())),
        ],
      ),
    );
  }
}
