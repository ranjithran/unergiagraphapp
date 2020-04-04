import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unergiagraphapp/Notifers/ActivityNotifer.dart';

class TwoIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityNotifier>(
      builder: (context, _, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _.status
                  ? Color.fromRGBO(0, 0, 0, 0.9)
                  : Color.fromRGBO(0, 0, 0, 0.4),
            ),
          ),
          Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 2.0,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: !_.status
                  ? Color.fromRGBO(0, 0, 0, 0.9)
                  : Color.fromRGBO(0, 0, 0, 0.4),
            ),
          ),
        ],
      ),
    );
  }
}
