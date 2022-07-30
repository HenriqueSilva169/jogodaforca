import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'function.dart';
import 'main.dart';

class result extends StatelessWidget {
  final String text;
  const result({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )),
        ElevatedButton(
            onPressed: () {
              String tip = tips[randomNumber];
              String word = words[randomNumber];
              foundLetters = List.filled(word.length, 0);
              int wrongCounter = 0;
              int rigtCounter = 0;
              String visibleLetters = showLetters(word, foundLetters);

              String text = "";
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: ((build) => MyApp())));
            },
            child: Text("Reiniciar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)))
      ],
    ));
  }
}
