import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTitle extends StatelessWidget {
  final String title;
  const MyTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          
          color: Colors.black,
          fontSize: ScreenUtil().setSp(40),
          fontWeight: FontWeight.w800,
          // letterSpacing: 1.5
        ),
      ),
    );
  }
}
