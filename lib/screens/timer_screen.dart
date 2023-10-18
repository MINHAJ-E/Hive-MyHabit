// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:my_habit_app/helpers/colors.dart';

// class TimerScreen extends StatefulWidget {
//   const TimerScreen({Key? key});

//   @override
//   _TimerScreenState createState() => _TimerScreenState();
// }

// class _TimerScreenState extends State<TimerScreen> {
//   late Timer _timer;
//   bool _isActive = false;
//   DateTime _startTime = DateTime.now();

//   String getFormattedTime() {
//     Duration difference = DateTime.now().difference(_startTime);
//     int milliseconds = difference.inMilliseconds;
//     int seconds = (milliseconds / 1000).truncate();
//     int minutes = (seconds / 60).truncate();
//     int hours = (minutes / 60).truncate();

//     seconds = seconds % 60;
//     minutes = minutes % 60;

//     return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
//   }

//   void _startTimer() {
//     _isActive = true;
//     _startTime = DateTime.now();
//     _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
//       setState(() {});
//     });
//   }

//   void _stopTimer() {
//     _isActive = false;
//     _timer.cancel();
//   }

//   void _resetTimer() {
//     _startTime = DateTime.now();
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     _timer.cancel(); // cancel the timer when the widget is disposed
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       backgroundColor: bggrey,
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: Center(child: const Text('TIMER',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
//       ),
//       body: Container(
//         decoration: BoxDecoration(  
//            image: DecorationImage(
//               image: AssetImage('assetsfoottball2.jpg'), // Replace with your own image path
//               fit: BoxFit.cover,
//         ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 getFormattedTime(),
//                 style: const TextStyle(
//                     fontSize: 64.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white70),
//               ),
//               const SizedBox(height: 30),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   ElevatedButton(
//                     onPressed: _isActive ? null : _startTimer,
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.amber, // Set your primary color here
//                     ),
//                     child: const Text('Start', style: TextStyle(fontSize: 18.0)),
//                   ),
//                   const SizedBox(width: 20),
//                   ElevatedButton(
//                     onPressed: _isActive ? _stopTimer : null,style: ElevatedButton.styleFrom(
//                       primary: Colors.amber, // Set your primary color here
//                     ),
//                     child: const Text('Stop', style: TextStyle(fontSize: 18.0)),
//                   ),
//                   const SizedBox(width: 20),
//                   ElevatedButton(
//                     onPressed: _resetTimer,style: ElevatedButton.styleFrom(
//                       primary: Colors.amber // Set your primary color here
//                     ),
//                     child: const Text('Reset', style: TextStyle(fontSize: 18.0)),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();   
}

class _TimerScreenState extends State<TimerScreen> {
  static const CountDownDuration = Duration(minutes: 10);
  Duration duration = CountDownDuration;
  Timer? timer;

  void reset() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }
    setState(() {
      duration = CountDownDuration;
    });
  }

  void addTime() {
    setState(() {
      duration = Duration(seconds: duration.inSeconds - 1);
      if (duration.inSeconds <= 0) {
        timer?.cancel();
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTime(),
            SizedBox(height: 20),
            buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildButtons() {
    final isRunning = timer != null && timer!.isActive;

    return isRunning
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  timer?.cancel();
                },
                child: Text("Stop"),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: reset,
                child: Text("Reset"),
              ),
            ],
          )
        : ElevatedButton(
            onPressed: startTimer,
            child: Text("START TIMER"),
          );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(time: hours, header: "HOURS"),
        const SizedBox(
          width: 8,
        ),
        buildTimeCard(time: minutes, header: "MINUTES"),
        const SizedBox(
          width: 8,
        ),
        buildTimeCard(time: seconds, header: "SECONDS"),
      ],
    );
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              time,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 72,
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(header),
        ],
      );
}
