import 'package:flutter/material.dart';

class BMIResultWidget extends StatelessWidget {
  final double bmi;

  const BMIResultWidget({required this.bmi, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Your BMI is:',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            bmi.toStringAsFixed(2),
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
