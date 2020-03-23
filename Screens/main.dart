import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(bmitracker());

// ignore: camel_case_types
class bmitracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        primaryColor: Color(0xFF006875),
        scaffoldBackgroundColor: Color(0xFF238294),
        textTheme: TextTheme(
            body1: TextStyle(
          color: Colors.white,
        )),
        accentColor: Colors.amberAccent,
      ),
      home: InputPage(),
    );
  }
}
