import 'package:flutter/material.dart';
import 'package:my_habit_app/bottombar/bottomBar.dart';

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
          home: BottomBar(),
    );
  }
}
