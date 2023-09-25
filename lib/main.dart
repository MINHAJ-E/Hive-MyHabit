import 'package:flutter/material.dart';
import 'package:my_habit_app/bottombar/bottomBar.dart';
import 'package:my_habit_app/logIn_Screens/splashScree.dart';
import 'package:my_habit_app/onBodyScreens/onBody_Screens.dart';

const SAVE_KEY_NAME = 'USER logged IN';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
          title: "MY HABIT",
          home: Screensplash(),
    );
  }
}
