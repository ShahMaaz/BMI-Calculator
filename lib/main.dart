import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0B21),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 25,
          ),
        ),
      ),
      title: 'BMI Calculator',
      // theme: ThemeData.fallback(),
      home: InputPage(),
    );
  }
}
