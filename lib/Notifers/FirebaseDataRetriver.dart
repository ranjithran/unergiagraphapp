import 'package:flutter/cupertino.dart';

class FirebaseNotfier extends ChangeNotifier {
  String _key = "Sun";

  String get key => _key;

  setKey(String value) {
    _key = value;
    notifyListeners();
  }
}
