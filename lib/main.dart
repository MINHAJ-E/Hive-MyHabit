import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_habit_app/model/habit/data_model.dart';
import 'package:my_habit_app/screens/logIn_Screens/app_firstscreen.dart';

// ignore: constant_identifier_names
const SAVE_KEY_NAME = 'USER logged IN';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(HabitModelAdapter().typeId)) {
    Hive.registerAdapter(HabitModelAdapter());
  }
  // if(!Hive.isAdapterRegistered(RegularModelAdapter().typeId)){
  //   Hive.registerAdapter(RegularModelAdapter());
  // }
  //  await Hive.openBox("Habit_Database");


  // Hive.registerAdapter(HabitModelAdapter());
  // Hive.registerAdapter(RegularModelAdapter());

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
          title: "MY HABIT",
          // theme: ThemeData(
        // primarySwatch: Colors.amber, // Define your primary color here
      // ),
          home: AppFirstScreen(),
          
    );
  }
}
