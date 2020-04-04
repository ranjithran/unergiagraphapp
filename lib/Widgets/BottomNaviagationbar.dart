import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:unergiagraphapp/Notifers/CardEvaliton.dart';
import 'package:unergiagraphapp/Notifers/FirebaseDataRetriver.dart';

class BottomNavigation extends StatelessWidget {
  final List<Carddate> _list = [
    new Carddate(0, "Sun"),
    new Carddate(1, "Mon"),
    new Carddate(2, "Tue"),
    new Carddate(3, "Wed"),
    new Carddate(4, "Thus"),
    new Carddate(5, "fir"),
    new Carddate(6, "Sat"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(150),
      child: ListView.builder(
        itemBuilder: (context, index) => Container(
          alignment: Alignment.center,
          width: ScreenUtil().setWidth(200),
          child: Consumer<CardElevation>(
            builder: (context, vare, child) => InkWell(
              child: InkWell(
                onTap: () {
                  vare.setState(index);
                  Provider.of<FirebaseNotfier>(context,listen: false).setKey(_list[index].title);
                },
                child: Container(
                  margin: EdgeInsets.all(2),
                  decoration:_list[index].eve==vare.status?BoxDecoration(boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 3.0,
                      offset: Offset(4.75, 1.75),
                    )
                  ], color: Colors.white):null,
                  child: Center(
                      child: Text(_list[index].title, style: TextStyle())),
                ),
              ),
            ),
          ),
        ),
        itemCount: _list.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
