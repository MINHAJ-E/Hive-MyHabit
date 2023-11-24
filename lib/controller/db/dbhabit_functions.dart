
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_habit_app/model/data_model.dart';

class DBProvider extends ChangeNotifier{

 List<HabitModel> searchedlist = [];
 List<HabitModel>result = [];
  List<HabitModel> habitList = [];
void addhabit(HabitModel value) async {
  final habitdb = await Hive.openBox<HabitModel>('student_db');
  final id =await habitdb.add(value);
  value.id = id;
  // value.add(value);
  getAllHabit();
  notifyListeners();
}

Future<List<HabitModel>>getAllHabit() async {
  final habitdb = await Hive.openBox<HabitModel>('student_db');
  final habits=habitdb.values.toList();
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
Future<void>editList(index,HabitModel value)async {
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
}
void updateCheck(int id, HabitModel data) async {
  final habitdb = await Hive.openBox<HabitModel>('student_db');
  await habitdb.putAt(id, data);
}
resethabit(int id)async{
final habitdb = await Hive.openBox<HabitModel>('student_db');
habitdb.clear();
getAllHabit();
}


  loadhabit(){
    searchedlist=habitList;
    
  }

void filterCustomerList(String query) {
  if (query.isEmpty) {
    result=habitList;
  }else{
 result= habitList
      .where((incomingModel) =>
          incomingModel.habit.toLowerCase().contains(query.toLowerCase())
          )
      .toList();
  }
  searchedlist = result;
  notifyListeners();
}
}