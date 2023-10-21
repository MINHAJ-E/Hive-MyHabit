import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_habit_app/model/regular/regular_model.dart';

ValueNotifier<List<RegularModel>>regularlistnotifier =ValueNotifier([]);

Future<void> addregular(RegularModel value)async{
  final regularDB=await Hive.openBox<RegularModel>('regular_db');
  await regularDB.add(value);
  regularlistnotifier.value.add(value);
  regularlistnotifier.notifyListeners();     
}   

Future<void>getAllregular()async{
   final regularDB=await Hive.openBox<RegularModel>('regular_db');
   regularlistnotifier.value.clear();
   regularlistnotifier.value.addAll(regularDB.values);
   regularlistnotifier.notifyListeners();
}

void addCheck(int id,RegularModel data) async {
  final regularDB = await Hive.openBox<RegularModel>('regular_db');
  await regularDB.putAt(id,data);
  getAllregular();
}