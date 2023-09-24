import 'package:flutter/material.dart';
import 'package:my_habit_app/model/dataModel.dart';

ValueNotifier<List<HabitModel>>habitListnotifier=ValueNotifier([]);

void addhabit(HabitModel value){
  habitListnotifier.value.add(value);
  habitListnotifier.notifyListeners();
}