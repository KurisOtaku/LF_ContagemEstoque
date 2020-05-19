import 'package:contagem_inventario/Objects/FormCadastroContagem.dart';
import 'package:flutter/material.dart';

class CadastroContagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    campos = new FormCadastroContagem();
    campos.init();
    return MaterialApp(
      title: 'Cadastrar Contagem',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CadastroContagemPage(title: 'Contagem Estoque'),
    );
  }
}

class CadastroContagemPage extends StatefulWidget {
  CadastroContagemPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CadastroContagemPageState createState() => _CadastroContagemPageState();
}

class _CadastroContagemPageState extends State<CadastroContagemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Estoque"),
      ),
      body: Center(
        child: Column(
          children: getForms(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.check),
      ),
    );
  }
}

FormCadastroContagem campos;

List<Widget> getForms() {
  return [
    for (var c in campos.getAll())
      TextField(
        key: Key(c.key),
        decoration: InputDecoration(
          labelText: '${c.descricao}',
        ),
        textInputAction: TextInputAction.next,
      ),
  ];
}
