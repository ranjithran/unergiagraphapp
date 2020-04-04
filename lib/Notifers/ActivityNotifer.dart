import 'package:flutter/cupertino.dart';

class ActivityNotifier extends ChangeNotifier{
  bool _status = true;
  bool get status=>_status;

  setBusy(bool value){
    _status=value;
    notifyListeners();
  } 

}