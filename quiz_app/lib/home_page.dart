import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 200),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Lunch',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          OutlinedButton(
            onPressed: () {
              // Add your button click logic here
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              side: const BorderSide(color: Colors.blue, width: 2),
              textStyle: const TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
            child: const Text('Beautiful Button'),
          ),
        ],
      ),
    );
  }
}
