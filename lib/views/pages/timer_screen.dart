
// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:my_habit_app/controller/timer_provider.dart';
import 'package:provider/provider.dart';


class TimerScreenContent extends StatelessWidget {
  const TimerScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    // var timerModel = Provider.of<TimerProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: const Center(child: Text("STOPWATCH", style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
      backgroundColor: const Color.fromARGB(221, 34, 33, 33),
      body: Center(
        child: Consumer<TimerProvider>(builder: (context, dbpro, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTime(dbpro),
              const SizedBox(height: 20),
              buildButtons(dbpro),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtons(dbpro) {
    final isRunning = dbpro.timer != null && dbpro.timer!.isActive;

    return isRunning
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  dbpro.timer?.cancel();
                  dbpro.startwatch(dbpro);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                child: const Text("Stop"),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: dbpro.reset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                child: const Text("Reset"),
              ),
            ],
          )
        : ElevatedButton(
            onPressed: dbpro.startTimer,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            child: const Text("START STOPWATCH"),
          );
  }

  Widget buildTime(dbpro) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(dbpro.duration.inHours);
    final minutes = twoDigits(dbpro.duration.inMinutes.remainder(60));
    final seconds = twoDigits(dbpro.duration.inSeconds.remainder(60));
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

