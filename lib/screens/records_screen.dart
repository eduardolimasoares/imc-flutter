class RecordsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hiveService = HiveService(); // ou forneça isto através de um provider/inherited widget

    return Scaffold(
      appBar: AppBar(
        title: Text('Registros de IMC'),
      ),
      body: FutureBuilder<List<IMCRecord>>(
        future: hiveService.getIMCRecords(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro ao carregar registros.');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('Nenhum registro encontrado.');
          } else {
            var records = snapshot.data!;

            return ListView.builder(
              itemCount: records.length,
              itemBuilder: (context, index) {
                var record = records[index];
                return ListTile(
                  title: Text(record.imc.toString()),
                  // Outras informações do registro podem ser exibidas aqui
                );
              },
            );
          }
        },
      ),
    );
  }
}
