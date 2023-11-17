// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_habit_app/model/data_model.dart';
// import 'package:my_habit_app/model/habit/data_model.dart';
import 'package:my_habit_app/screens/logIn_Screens/app_firstscreen.dart';  


const SAVE_KEY_NAME = 'USER logged IN';
const SAVE_KEY_CHECK = 'add check';
  //  SharedPreferences prefs = await SharedPreferences.getInstance();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();


  if (!Hive.isAdapterRegistered(HabitModelAdapter().typeId)) {
    Hive.registerAdapter(HabitModelAdapter());
  }

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      debugShowCheckedModeBanner: false,
          title: "MY HABIT",
          home: AppFirstScreen(),
          
    );
  }
}
