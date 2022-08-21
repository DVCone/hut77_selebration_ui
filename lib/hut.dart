import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hut_selebration_ui/button_widget.dart';
import 'package:hut_selebration_ui/victory_widget.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  static const maxSeconds = 5;
  int seconds = maxSeconds;
  Timer? timer;

  //Reset Function
  void resetTimer() => setState(
        () => seconds = maxSeconds,
      );

  //Start Function
  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      }
    });
  }

  @override
  //Main Widget
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTime(),
              const SizedBox(
                height: 40,
              ),
              buildButtons(),
            ],
          ),
        ),
      );

  //Button Widget
  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = seconds == maxSeconds || seconds == 0;

    return isRunning || !isCompleted
        ? ButtonWidget(
            onClicked: () {
              if (isRunning) {
                null;
              } else {
                startTimer(reset: false);
              }
            },
            text: "Start",
            backgroundColor: const Color(0xff2b2b2b),
          )
        : ButtonWidget(
            onClicked: () {
              startTimer();
            },
            color: Colors.black,
            backgroundColor: Colors.white,
            text: "Start",
          );
  }

  //Content Widget
  Widget buildTime() {
    if (seconds == 0) {
      return const VictoryWidget();
    } else {
      return Text(
        '$seconds',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 80,
        ),
      );
    }
  }
}
