import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  static const maxSeconds = 5;
  int seconds = maxSeconds;
  Timer? timer;

  void resetTimer() => setState(
        () => seconds = maxSeconds,
      );

  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        stopTimer(reset: false);
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    setState(
      () => timer?.cancel(),
    );
  }

  @override
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

class VictoryWidget extends StatelessWidget {
  const VictoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          " Showwcase Flutter Indonesia \nmengucapkan :",
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        Image(
          image: AssetImage("images/hut.png"),
          height: 150,
          width: 150,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Dirgahayu \nIndonesiaku!",
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 50,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.onClicked,
    required this.text,
    this.backgroundColor = Colors.black,
    this.color = Colors.white,
  }) : super(key: key);

  final String text;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
        onPressed: onClicked,
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: color),
        ),
      );
}
