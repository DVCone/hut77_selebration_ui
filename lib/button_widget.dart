import 'package:flutter/material.dart';

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
