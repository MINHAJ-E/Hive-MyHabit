// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:my_habit_app/screens/chart_screen.dart';
import 'package:my_habit_app/screens/favorite_screen.dart';
import 'package:my_habit_app/screens/timer_screen.dart';
import 'package:my_habit_app/screens/today_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key, required String title}) : super(key: key);

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
    TodayScreen(title: ''),
    FavoritteScreen(title: ''),
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
          BottomNavigationBarItem(icon: Icon(Icons.today), label: 'Today'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: 'Chart'),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Timer'),
        ],
      ),
    );
  }
}
