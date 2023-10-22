import 'package:flutter/material.dart';
import 'package:imc/models/calculadora_imc_model.dart'; 
import 'package:imc/widgets/imc_form.dart'; 

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _imcResultController = TextEditingController();

  void _calculateIMC(double weight, double height) {
    final imc = CalculadoraIMCModel.calculateIMC(weight, height);
    _imcResultController.text = 'Seu IMC é ${imc.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            IMCForm(onCalculate: _calculateIMC),
            TextFormField(
              controller: _imcResultController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Resultado',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
