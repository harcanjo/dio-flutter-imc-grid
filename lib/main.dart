import 'package:flutter/material.dart';

import 'calcula_imc.dart';
import 'home.dart';

void main() {
  IMC imc = IMC(weight: 70, height: 1.75);
  double bmi = imc.calculate();
  runApp(MyApp(bmi: bmi));
}

class MyApp extends StatelessWidget {
  final double bmi;

  const MyApp({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(bmi: bmi),
    );
  }
}
