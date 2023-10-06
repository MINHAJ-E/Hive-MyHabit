import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_habit_app/model/task/data_model.dart';

ValueNotifier<List<TaskModel>>taskListnotifier=ValueNotifier([]);

void addtask(TaskModel value) async {
  final taskdb = await Hive.openBox<TaskModel>('student_db');
  final id =await taskdb.add(value);
  value.id =id;
  taskListnotifier.value.add(value);
  taskListnotifier.notifyListeners();
}

getAllTAsk() async {
  final taskdb = await Hive.openBox<TaskModel>('student_db');
  taskListnotifier.value.clear();
  taskListnotifier.value.addAll(taskdb.values);
  taskListnotifier.notifyListeners();
}
void deletetask(int id) async {
  final taskdb = await Hive.openBox<TaskModel>('student_db');
  await taskdb.deleteAt(id);
  getAllTAsk();
}
// void addCheck(int id,HabitModel data) async {
//   final taskdb = await Hive.openBox<TaskModel>('student_db');
//   await taskdb.putAt(id,data);
//   getAllHabit();
// }

