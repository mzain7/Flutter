import 'package:assignment_api/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 20, 6, 99));
var kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 20, 6, 99),
    brightness: Brightness.dark);

    
    

var darkTheme = ThemeData.dark().copyWith(
  colorScheme: kDarkColorScheme,
  useMaterial3: true,
  cardTheme: const CardTheme().copyWith(
    color: kDarkColorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: kDarkColorScheme.primaryContainer,
        foregroundColor: kDarkColorScheme.onPrimaryContainer),
  ),
  textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme).copyWith(

    titleLarge: const TextStyle(
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontSize: 24,
    ),
  ),
);

var theme = ThemeData().copyWith(
  colorScheme: kColorScheme,
  useMaterial3: true,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kColorScheme.onPrimaryContainer,
    foregroundColor: kColorScheme.primaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kColorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorScheme.primaryContainer,
    ),
  ),
  textTheme: GoogleFonts.latoTextTheme().copyWith(
    titleLarge: const TextStyle(
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontSize: 24,
    ),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 2',
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home:  const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
