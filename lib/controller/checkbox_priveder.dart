
import 'package:flutter/material.dart';

class CheckProvider extends ChangeNotifier{
  void checkk(data,newvalue){
    data.taskcomplete = newvalue!;
    notifyListeners();
}
}