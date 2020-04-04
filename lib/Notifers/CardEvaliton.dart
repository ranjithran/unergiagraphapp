import 'package:flutter/cupertino.dart';
class Carddate{
  String title;
  int eve;
Carddate(this.eve,this.title);
}

class CardElevation extends ChangeNotifier{
  int _status=100;
  int get status=>_status;
  setState(int e){
    _status=e;
    notifyListeners();
  }


}