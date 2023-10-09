import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_habit_app/model/habit/data_model.dart';

ValueNotifier<List<HabitModel>>habitListnotifier=ValueNotifier([]);

void addhabit(HabitModel value) async {
  final habitdb = await Hive.openBox<HabitModel>('student_db');
  final id =await habitdb.add(value);
  value.id = id;
  habitListnotifier.value.add(value);
  habitListnotifier.notifyListeners();
}

void getAllHabit() async {
  final studentdb = await Hive.openBox<HabitModel>('student_db');
  habitListnotifier.value.clear();
  habitListnotifier.value.addAll(studentdb.values);
  habitListnotifier.notifyListeners();
}
void deletehabit(int id) async {
  final studentdb = await Hive.openBox<HabitModel>('student_db');
  await studentdb.deleteAt(id);
  getAllHabit();
}
Future<void>editList(index,HabitModel value)async {
 final studentdb = await Hive.openBox<HabitModel>('student_db');
 habitListnotifier.value.clear();
 habitListnotifier.value.addAll(studentdb.values);
 habitListnotifier.notifyListeners();
 studentdb.putAt(index, value);
 getAllHabit();
 
}
void addCheck(int id,HabitModel data) async {
  final tododb = await Hive.openBox<HabitModel>('student_db');
  await tododb.putAt(id,data);
  getAllHabit();
}


