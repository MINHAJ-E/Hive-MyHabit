import 'package:flutter/material.dart';
import 'package:my_habit_app/helpers/colors.dart';

class HabitUnChecked extends StatefulWidget {
  const HabitUnChecked({super.key});

  @override
  State<HabitUnChecked> createState() => _HabitUnCheckedState();
}

class _HabitUnCheckedState extends State<HabitUnChecked> {
  @override
 Widget build(BuildContext context) {
 
    return Scaffold(
      backgroundColor: bggrey,
      appBar: AppBar(
        backgroundColor: bggreyisue,
        title: Text('Habit Chart'),
      ),
      body: Center(
        child: BarChart(),
      ),
    );
  }
}

class BarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Bar(color: Colors.blue, height: 300),
          Bar(color: Colors.green, height: 300),
          Bar(color: Colors.orange, height: 300),
          Bar(color: Colors.red, height: 300),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final Color color;
  final double height;

  Bar({required this.color, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 50,
      height: height,
    );
  }
}