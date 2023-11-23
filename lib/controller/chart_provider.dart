// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:my_habit_app/services/db/dbhabit_functions.dart';
// import 'package:my_habit_app/model/data_model.dart';
// import 'package:provider/provider.dart';

// class ChartProvider extends ChangeNotifier {
  
//   List<HabitModel> _habits = [];

//   List<HabitModel> get habits => _habits;

//    loadHabits(context) async {
//     _habits = await Provider.of<DBProvider>(context, listen: false). getAllHabit();
//     notifyListeners();
//   }
// }