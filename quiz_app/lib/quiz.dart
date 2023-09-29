import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home_page.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';

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
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void goHome() {
    answers = [];
    setState(() {
      activeScreen = 'home-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentScreen;
    switch (activeScreen) {
      case 'home-screen':
        currentScreen = MyHomePage(switchScreen);
        break;
      case 'question-screen':
        currentScreen = QuestionScreen(chooseAnswer);
        break;
      case 'result-screen':
        currentScreen = ResultsScreen(
          chosenAnswers: answers,
          onRestart: goHome,
        );
        break;

      default:
    }
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
            child: currentScreen,
          ),
        ),
      ),
    );
  }
}
