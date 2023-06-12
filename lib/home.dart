import 'package:flutter/material.dart';

import 'calcula_imc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  double? bmi;

  void _calculateBMI() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    IMC imc = IMC(weight: weight, height: height);
    setState(() {
      bmi = imc.calculate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: weightController,
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: heightController,
              decoration: const InputDecoration(
                labelText: 'Altura (m)',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: const Text('Calcular IMC'),
            ),
            if (bmi != null) Text('IMC: $bmi'),
          ],
        ),
      ),
    );
  }
}
