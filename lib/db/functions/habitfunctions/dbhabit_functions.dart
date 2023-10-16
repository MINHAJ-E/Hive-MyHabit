import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_habit_app/model/habit/data_model.dart';

ValueNotifier<List<HabitModel>>habitListnotifier=ValueNotifier([]);
List<HabitModel>regularwork = [];

void addhabit(HabitModel value) async {
  final habitdb = await Hive.openBox<HabitModel>('student_db');
  final id =await habitdb.add(value);
  value.id = id;
  habitListnotifier.value.add(value);
  habitListnotifier.notifyListeners();
}

void getAllHabit() async {
  final habitdb = await Hive.openBox<HabitModel>('student_db');
  habitListnotifier.value.clear();
  habitListnotifier.value.addAll(habitdb.values);
  habitListnotifier.notifyListeners();
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
void addCheck(int id,HabitModel data) async {
  final habitdb = await Hive.openBox<HabitModel>('student_db');
  await habitdb.putAt(id,data);
  getAllHabit();
}
addtoregularwork(HabitModel data) async {
  final favDB = await Hive.openBox<HabitModel>('fav_db');
  if (!regularwork.contains(data)) {
    regularwork.add(data);
    favDB.add(data);
  }
}

getallregularwork() async {
  final favDB = await Hive.openBox<HabitModel>('fav_db');
  regularwork.clear();
  regularwork = favDB.values.toList();
}
deleteregularwork(int id) async {
  final favDB = await Hive.openBox<HabitModel>('fav_db');
  favDB.deleteAt(id);
  regularwork.removeAt(id);
  getallregularwork();
}
void addCheckregular(int id,HabitModel data) async {
  final favDB = await Hive.openBox<HabitModel>('fav_db');
  await favDB.putAt(id,data);
  getallregularwork();
}
resethabit(int id)async{
final habitdb = await Hive.openBox<HabitModel>('student_db');
habitdb.clear();
getAllHabit();
}
resetregular(int id)async{
final favDB = await Hive.openBox<HabitModel>('fav_db');
favDB.clear();
getallregularwork();
}
// addDateToHive(DateTime date) async {
//   var datedb = await Hive.openBox<HabitModel>('dates');
//   await datedb.add(date as HabitModel);
// }

