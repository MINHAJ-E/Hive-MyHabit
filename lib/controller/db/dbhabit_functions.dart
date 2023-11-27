import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_habit_app/model/data_model.dart';

class DBProvider extends ChangeNotifier {
  List<HabitModel> searchedlist = [];
  List<HabitModel> result = [];
  List<HabitModel> habitList = [];
  void addhabit(HabitModel value) async {
    final habitdb = await Hive.openBox<HabitModel>('student_db');
    final id = await habitdb.add(value);
    value.id = id;
    // value.add(value);
    getAllHabit();
    notifyListeners();
  }

  Future<List<HabitModel>> getAllHabit() async {
    final habitdb = await Hive.openBox<HabitModel>('student_db');
    final habits = habitdb.values.toList();
    searchedlist.clear();
    searchedlist.addAll(habitdb.values);
    notifyListeners();
    return habits;
  }

  void deletehabit(int id) async {
    final habitdb = await Hive.openBox<HabitModel>('student_db');
    await habitdb.deleteAt(id);
    getAllHabit();
  }

  Future<void> editList(index, HabitModel value) async {
    final habitdb = await Hive.openBox<HabitModel>('student_db');
    searchedlist.clear();
    searchedlist.addAll(habitdb.values);
    notifyListeners();
    habitdb.putAt(index, value);
    getAllHabit();
  }

  void addCheck(int id, HabitModel data) async {
    final habitdb = await Hive.openBox<HabitModel>('student_db');
    await habitdb.putAt(id, data);
    getAllHabit();
    notifyListeners();
  }

  void updateCheck(int id, HabitModel data) async {
    final habitdb = await Hive.openBox<HabitModel>('student_db');
    await habitdb.putAt(id, data);
    notifyListeners();
  }

  resethabit(int id) async {
    final habitdb = await Hive.openBox<HabitModel>('student_db');
    habitdb.clear();
    getAllHabit();
    notifyListeners();
  }

  loadhabit() {
    searchedlist = habitList;
  }

  void filterList(String query) {
    if (query.isEmpty) {
      result = habitList;
    } else {
      result = habitList
          .where((incomingModel) =>
              incomingModel.habit.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    searchedlist = result;
    notifyListeners();
  }
}
