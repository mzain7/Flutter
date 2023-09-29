import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home_page.dart';
import 'package:quiz_app/question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'home-screen';
  List<String> answers = [];

  switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    answers.add(answer);
    if (answers.length == questions.length) {
      answers = [];
      setState(() {
        activeScreen = 'home-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Time',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      home: Scaffold(
        // appBar: AppBar(),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Color.fromARGB(255, 25, 2, 71)],
            ),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.center,
            child: activeScreen == 'home-screen'
                ? MyHomePage(switchScreen)
                : QuestionScreen(chooseAnswer),
          ),
        ),
      ),
    );
  }
}
