import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 250,
          color: const Color.fromARGB(183, 255, 255, 255),
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          'It\'s time to test your Flutter',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            side: const BorderSide(color: Colors.blue, width: 2),
          ),
          icon: const Icon(Icons.arrow_circle_right_outlined,
              color: Color.fromARGB(160, 255, 255, 255)),
          label: const Text(
            'Start Quiz!',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ],
    );
  }
}
