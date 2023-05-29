import 'package:flutter/material.dart';

class Tema {
  criaTema() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlue[800],
      fontFamily: 'Georgia',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
        bodyText1: TextStyle(fontSize: 14, fontFamily: 'Hind'),
      ),
    );
  }
}
