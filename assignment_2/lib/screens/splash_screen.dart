import 'dart:async';

import 'package:assignment_2/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplahScreen extends StatefulWidget {
  const SplahScreen({super.key});

  @override
  _SplahScreenState createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/logo.png', width: 300,),
            Text(
              'Splah Screen!',
              style: Theme.of(context).textTheme.titleLarge 
            ),
          ],
        ),
      ),
    );
  }
}
