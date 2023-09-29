import 'package:flutter/material.dart';
import 'package:quiz_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Time',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Color.fromARGB(255, 25, 2, 71)],
            ),
          ),
          child: MyHomePage(),
        ),
      ),
    );
  }
}
