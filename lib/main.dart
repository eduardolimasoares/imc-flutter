import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(CalculadoraIMC());
}

class CalculadoraIMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
