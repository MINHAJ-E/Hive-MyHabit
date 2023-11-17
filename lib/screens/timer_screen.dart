import 'dart:async';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();   
}

class _TimerScreenState extends State<TimerScreen> {
  // ignore: constant_identifier_names
  static const CountDownDuration = Duration(minutes: 0);
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
      duration = Duration(seconds: duration.inSeconds + 1);
      if (duration.inSeconds <= 0) {
        timer?.cancel();
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  @override
  void dispose() {   
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber,  automaticallyImplyLeading: false, toolbarHeight: 80,
    
      title: const Center(child: Text("STOPWATCH",style: TextStyle(fontWeight: FontWeight.bold ),)),
      ),
      backgroundColor: const Color.fromARGB(221, 34, 33, 33),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTime(),
            const SizedBox(height: 20),
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
                style: ElevatedButton.styleFrom(
    backgroundColor: Colors.amber, // Set your desired color here
  ),
                child: const Text("Stop"),
                
              ),
              const SizedBox(width: 12),
             ElevatedButton(
  onPressed: reset,
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.amber, // Set your desired color here
  ),
  child: const Text("Reset"),
)

              
            ],
          )
        : ElevatedButton(
            onPressed: startTimer,
            style: ElevatedButton.styleFrom(
    backgroundColor: Colors.amber, // Set your desired color here
  ),
            child: const Text("START STOPWATCH"),
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
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              time,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 72,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(header),
        ],
      );
}
