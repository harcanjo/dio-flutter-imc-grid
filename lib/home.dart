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
  final List<Map<String, double>> history = [];

  void _calculateBMI() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    IMC imc = IMC(weight: weight, height: height);
    double bmi = imc.calculate();
    setState(() {
      history.insert(0, {'weight': weight, 'height': height, 'bmi': bmi});
      if (history.length > 5) {
        history.removeLast();
      }
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
            SizedBox(height: 16),
            TextField(
              controller: heightController,
              decoration: const InputDecoration(
                labelText: 'Altura (m)',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _calculateBMI,
                child: const Text('Calcular IMC'),
              ),
            ),
            SizedBox(height: 16),
            if (history.isNotEmpty)
              Table(
                border: TableBorder.all(),
                columnWidths: const {
                  0: FixedColumnWidth(80),
                  1: FixedColumnWidth(80),
                  2: FixedColumnWidth(80),
                },
                children: [
                  TableRow(children: [
                    const Text('Peso'),
                    const Text('Altura'),
                    const Text('IMC'),
                  ]),
                  ...history.map((entry) {
                    return TableRow(children: [
                      Text(entry['weight'].toString()),
                      Text(entry['height'].toString()),
                      Text(entry['bmi']!.toStringAsFixed(2)),
                    ]);
                  }).toList(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
