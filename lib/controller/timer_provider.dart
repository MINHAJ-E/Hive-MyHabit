
import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  // ignore: constant_identifier_names
  static const CountDownDuration = Duration(minutes: 0);
  Duration duration = CountDownDuration;
  Timer? timer;

  void reset() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }
    duration = CountDownDuration;
    notifyListeners();
  }

  void addTime() {
    duration = Duration(seconds: duration.inSeconds + 1);
    if (duration.inSeconds <= 0) {
      timer?.cancel();
    }
    notifyListeners();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  startwatch(timerModel){
      timerModel.notifyListeners();
  }
}