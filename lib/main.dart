import 'package:flutter/material.dart';
import 'package:km_to_miles_proov/screens/calc_screen.dart';
import 'package:km_to_miles_proov/screens/converter_screen.dart';
import 'package:km_to_miles_proov/screens/intro_screen.dart';
import 'package:km_to_miles_proov/screens/notes.dart';
import 'package:km_to_miles_proov/screens/prev_calc_list.dart';


void main() {
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        '/': (context) => const IntroScreen(),
        '/calc': (context) => CalcScreen(),
        '/converter': (context) => ConverterScreen(),
        '/calchistory': (context) => PrevCalcScreen(),
        '/sqlitecalchistory': (context) => NotesScreen(),
      },
      initialRoute: '/',
    );
  }
}
