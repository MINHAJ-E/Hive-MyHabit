import 'package:flutter/material.dart';
// import 'package:my_habit_app/bottombar/bottom_bar.dart';
import 'package:my_habit_app/logIn_Screens/app_firstscreen.dart';
// import 'package:my_habit_app/logIn_Screens/splash_screen.dart';
// import 'package:my_habit_app/introPage/onBodyScreens/onbody_screens.dart';

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
          home: AppFirstScreen(),
    );
  }
}
