import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roll Dice',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rolling'),
          backgroundColor: const Color.fromARGB(255, 84, 5, 5),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 18, 2, 75),
                Color.fromARGB(255, 67, 6, 117)
              ],
            ),
          ),
          child: const Center(
            child: Dice(),
          ),
        ),
      ),
    );
  }
}

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() {
    return _DiceState();
  }
}

class _DiceState extends State<Dice> {
  var activeDiceImage = 'assets/images/dice-5.png';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 250,
        ),
        TextButton(
          onPressed: () {
            int diceNumber = randomizer.nextInt(6)+1;
            setState(() {
              activeDiceImage = 'assets/images/dice-$diceNumber.png';
            });
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice!'),
        ),
      ],
    );
  }
}
