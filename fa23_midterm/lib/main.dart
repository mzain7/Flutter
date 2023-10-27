import 'package:fa23_midterm/screen/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF150630),
        secondaryHeaderColor: const Color(0xFF9CF560),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFFCDE2BE),
          textTheme: ButtonTextTheme.normal,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal),
          bodySmall: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal)
        ),
        cardTheme: const CardTheme(
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          color: Color(0xFF150630),
          elevation: 5,
          shadowColor: Colors.black,
        ),
      ),
      home: const HomePage(),
    );
  }
}
