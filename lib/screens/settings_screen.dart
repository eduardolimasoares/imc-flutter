class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _heightController;
  final _formKey = GlobalKey<FormState>();
  Box<double>? _settingsBox;

  @override
  void initState() {
    super.initState();
    _settingsBox = Hive.box<double>('settings');
    _heightController = TextEditingController(text: _settingsBox!.get('height')?.toString() ?? '');
  }

  void _saveHeight() {
    if (_formKey.currentState!.validate()) {
      final double height = double.parse(_heightController.text);
      _settingsBox!.put('height', height);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Sua altura (metros)',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira sua altura';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _saveHeight,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
