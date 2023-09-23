// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:my_habit_app/screens/chartScreen.dart';
import 'package:my_habit_app/screens/habitScreen.dart';
import 'package:my_habit_app/screens/taskScreen.dart';
import 'package:my_habit_app/screens/timerScreen.dart';
import 'package:my_habit_app/screens/todayScreen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
 int _selectedindex = 0;
void _navigationbottombar(int index){{
  setState(() {
    _selectedindex=index;

  });
}}
final List<Widget>_pages=[
   TodayScreen(),
   HabitScreen(),
   TaskScreen(),
   ChartScreen(),
   TimerScreen(),

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_pages[_selectedindex],
           bottomNavigationBar:BottomNavigationBar(
            backgroundColor: Colors.amber,
            currentIndex: _selectedindex,
            type: BottomNavigationBarType.fixed,
            onTap: _navigationbottombar,
                items:const [
              BottomNavigationBarItem(icon: Icon(Icons.today),label: 'Today'),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Habit'),
              BottomNavigationBarItem(icon: Icon(Icons.task),label: 'Task'),
              BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded),label: 'Chart'),
              BottomNavigationBarItem(icon: Icon(Icons.timer),label: 'Timer'),
                     ],
                    // backgroundColor: Colors.amber,
                     ),
           
        
      
    );
  }
}