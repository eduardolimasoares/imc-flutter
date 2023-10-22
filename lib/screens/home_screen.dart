import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:imc/models/imc_record.dart';
import 'package:imc/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _weightController;
  final _formKey = GlobalKey<FormState>();
  double? _imc;
  Box<double>? _settingsBox;
  Box<IMCRecord>? _recordsBox;

  @override
  void initState() {
    super.initState();
    _weightController = TextEditingController();
    _settingsBox = Hive.box<double>('settings');
    _recordsBox = Hive.box<IMCRecord>('records');
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  void _calculateAndSaveIMC() {
    if (_formKey.currentState!.validate()) {
      final double height = _settingsBox!.get('height') ?? 0;
      final double weight = double.parse(_weightController.text);
      final double imc = weight / (height * height);

      setState(() {
        _imc = imc;
      });

      final imcRecord = IMCRecord(weight: weight, imc: imc);
      _recordsBox!.add(imcRecord);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Seu peso (kg)',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu peso';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _calculateAndSaveIMC,
              child: Text('Calcular'),
            ),
            if (_imc != null) Text('Seu IMC é $_imc'),
            // Aqui você pode adicionar um widget para exibir todos os registros de IMC
          ],
        ),
      ),
    );
  }
}

// Continue com a implementação da tela de configurações e a lógica associada para salvar e recuperar a altura
