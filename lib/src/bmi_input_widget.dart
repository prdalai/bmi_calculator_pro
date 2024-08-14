import 'package:bmi_calculator_pro/utils/unit_conversion.dart';
import 'package:flutter/material.dart';

class BMIInputWidget extends StatefulWidget {
  final Function(double weight, double height, String unit) onCalculate;

  const BMIInputWidget({required this.onCalculate, super.key});

  @override
  _BMIInputWidgetState createState() => _BMIInputWidgetState();
}

class _BMIInputWidgetState extends State<BMIInputWidget> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _selectedUnit = 'Metric (kg, cm)';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _weightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
                labelText: _selectedUnit.startsWith('Metric') ? 'Weight (kg)' : 'Weight (lbs)'),
          ),
          TextField(
            controller: _heightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
                labelText: _selectedUnit.startsWith('Metric') ? 'Height (cm)' : 'Height (inches)'),
          ),
          DropdownButton<String>(
            value: _selectedUnit,
            items: <String>['Metric (kg, cm)', 'Imperial (lbs, inches)']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedUnit = newValue!;
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              double weight = double.parse(_weightController.text);
              double height = double.parse(_heightController.text);

              if (_selectedUnit == 'Imperial (lbs, inches)') {
                // Convert to metric units
                weight = UnitConversion.lbsToKg(weight);
                height = UnitConversion.inchToCm(height);
              }

              widget.onCalculate(weight, height, _selectedUnit);
            },
            child: const Text('Calculate BMI'),
          ),
        ],
      ),
    );
  }
}
