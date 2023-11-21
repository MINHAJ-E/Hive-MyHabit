// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:my_habit_app/views/chart_screen.dart';
import 'package:my_habit_app/widgets/checked_unchecked.dart';
import 'package:my_habit_app/views/timer_screen.dart';
import 'package:my_habit_app/views/today_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedindex = 0;

  void _navigationbottombar(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final List<Widget> _pages = [
    TodayScreen(),
    RegularWork(),
    HabitChart(),
    TimerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber, // Set the background color to transparent
        currentIndex: _selectedindex,
        type: BottomNavigationBarType.fixed,
        onTap: _navigationbottombar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.done_all_outlined), label: 'Done'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: 'Chart'),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Stopwatch'),
        ],
      ),
    );
  }
}