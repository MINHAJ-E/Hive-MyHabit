// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

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

Future<List<HabitModel>>getAllHabit() async {
  final habitdb = await Hive.openBox<HabitModel>('student_db');
  final habits=habitdb.values.toList();
  habitListnotifier.value.clear();
  habitListnotifier.value.addAll(habitdb.values);
  habitListnotifier.notifyListeners();
  return habits;
}
void deletehabit(int id) async {
  final habitdb = await Hive.openBox<HabitModel>('student_db');
  await habitdb.deleteAt(id);
  getAllHabit();
}
Future<void>editList(index,HabitModel value)async {
 final habitdb = await Hive.openBox<HabitModel>('student_db');
 habitListnotifier.value.clear();
 habitListnotifier.value.addAll(habitdb.values);
 habitListnotifier.notifyListeners();
 habitdb.putAt(index, value);
 getAllHabit();
 
}


void updateCheck(int id, HabitModel data) async {
  final habitdb = await Hive.openBox<HabitModel>('student_db');
  await habitdb.putAt(id, data);
}

void addCheck(int id, HabitModel data) async {
  final habitdb = await Hive.openBox<HabitModel>('student_db');
  await habitdb.putAt(id, data);
  getAllHabit();
}
// void addCheck(int id, HabitModel data) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   DateTime lastCheckedDate = DateTime.parse(prefs.getString('lastCheckedDate$id') ?? DateTime.now().toString());

//   if (DateTime.now().isAfter(lastCheckedDate.add(const Duration(days: 1)))) {
//     data.taskcomplete = false; 
//     prefs.setBool('isChecked$id', false);
//   }

//   prefs.setString('lastCheckedDate$id', DateTime.now().toString());

//   // Set the boolean value associated with SAVE_KEY_CHECK
//   await prefs.setBool(SAVE_KEY_CHECK, true);

//   getAllHabit(); // Assuming getAllHabit() is a synchronous function
// }




// void addCheck(int id, HabitModel data) async {
//   final habitdb = await Hive.openBox<HabitModel>('student_db');

//   DateTime now = DateTime.now();
//   String formattedDate = "${now.year}-${now.month}-${now.day}";

//   if (data.lastUpdatedDate != formattedDate) {
    
//     data.taskcomplete = false;
//     data.lastUpdatedDate = formattedDate;
//   }

//   await habitdb.putAt(id, data);
//   getAllHabit();
// }


resethabit(int id)async{
final habitdb = await Hive.openBox<HabitModel>('student_db');
habitdb.clear();
getAllHabit();
}
