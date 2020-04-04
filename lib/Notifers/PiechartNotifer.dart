import 'package:flutter/foundation.dart';

class PiechartNotifir extends ChangeNotifier{

List <double> _chartvalues=[10.0,50.0,90.0];
int _cal = 0;
List<double> get chartvalues=>_chartvalues;
 int get cla => _cal;

setChartvalue(List<double> values,int val){
  _chartvalues.clear();
print(values);
  _chartvalues=values;
    _cal = val;
  notifyListeners();
}


}