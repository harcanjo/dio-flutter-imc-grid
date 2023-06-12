import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final double bmi;

  const MyHomePage({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Center(
        child: Text('IMC: $bmi'),
      ),
    );
  }
}
