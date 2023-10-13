import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_habit_app/helpers/colors.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key});

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Timer _timer;
  bool _isActive = false;
  DateTime _startTime = DateTime.now();

  String getFormattedTime() {
    Duration difference = DateTime.now().difference(_startTime);
    int milliseconds = difference.inMilliseconds;
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    seconds = seconds % 60;
    minutes = minutes % 60;

    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _startTimer() {
    _isActive = true;
    _startTime = DateTime.now();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  void _stopTimer() {
    _isActive = false;
    _timer.cancel();
  }

  void _resetTimer() {
    _startTime = DateTime.now();
    setState(() {});
  }

  @override
  void dispose() {
    _timer.cancel(); // cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: bggrey,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Timer'),
      ),
      body: Container(
        decoration: BoxDecoration(  
           image: DecorationImage(
              image: AssetImage('assetsfoottball2.jpg'), // Replace with your own image path
              fit: BoxFit.cover,
        ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                getFormattedTime(),
                style: const TextStyle(
                    fontSize: 64.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 14, 179, 49)),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _isActive ? null : _startTimer,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Set your primary color here
                    ),
                    child: const Text('Start', style: TextStyle(fontSize: 18.0)),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _isActive ? _stopTimer : null,style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Set your primary color here
                    ),
                    child: const Text('Stop', style: TextStyle(fontSize: 18.0)),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _resetTimer,style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent // Set your primary color here
                    ),
                    child: const Text('Reset', style: TextStyle(fontSize: 18.0)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
