import 'package:flutter/material.dart';

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
          height: 30,
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
          "Dirgahayu \nIndonesia",
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
