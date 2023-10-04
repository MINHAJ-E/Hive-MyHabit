import 'package:flutter/material.dart';
import 'package:my_habit_app/model/data_model.dart';

ValueNotifier<List<HabitModel>>habitListnotifier=ValueNotifier([]);

void addhabit(HabitModel value){
  habitListnotifier.value.add(value);
  habitListnotifier.notifyListeners();
}
ValueNotifier<List<TaskModel>> taskListnotifier = ValueNotifier([]);

void addTask(TaskModel value2) {
  taskListnotifier.value.add(value2);
  taskListnotifier.notifyListeners();
}
