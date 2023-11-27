// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_habit_app/controller/add_habit.provider.dart';
import 'package:my_habit_app/model/data_model.dart';
import 'package:my_habit_app/controller/bottom_provider.dart';
import 'package:my_habit_app/controller/checkbox_priveder.dart';
import 'package:my_habit_app/controller/timer_provider.dart';
import 'package:my_habit_app/controller/db/dbhabit_functions.dart';
import 'package:my_habit_app/views/loginscreen/app_firstscreen.dart';
import 'package:provider/provider.dart';  


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
    return   MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomProvider(),),
        ChangeNotifierProvider(create: (context) => CheckProvider(),),
        ChangeNotifierProvider(create: (context) => TimerProvider(),),
        ChangeNotifierProvider(create: (context) => DBProvider(),),
        // ChangeNotifierProvider(create: (context) => AddHabit(),),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
            title: "MY HABIT",
            home: AppFirstScreen(),
      ),
    );
  }
}
