import 'package:flutter/material.dart';

class IMCForm extends StatelessWidget {
  final Function(double weight, double height) onCalculate;

  IMCForm({required this.onCalculate});

  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _weightController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Peso (kg)',
          ),
        ),
        TextFormField(
          controller: _heightController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Altura (cm)',
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            final weight = double.tryParse(_weightController.text);
            final height = double.tryParse(_heightController.text);
            if (weight != null && height != null) {
              onCalculate(weight, height / 100); // altura convertida para metros
            }
          },
          child: Text('Calcular'),
        ),
      ],
    );
  }
}
