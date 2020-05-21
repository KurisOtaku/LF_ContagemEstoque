import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:contagem_inventario/Objects/FormCadastroContagem.dart';
import '../Objects/Contagem.dart';

class CadastroContagem extends StatelessWidget {
  final BuildContext context;

  CadastroContagem(this.context) {}
  @override
  Widget build(BuildContext context) {
    campos = new FormCadastroContagem();
    campos.init();
    return CadastroContagemPage(title: 'Contagem Estoque');
  }
}

class CadastroContagemPage extends StatefulWidget {
  CadastroContagemPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CadastroContagemPageState createState() => _CadastroContagemPageState();
}

class _CadastroContagemPageState extends State<CadastroContagemPage> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Estoque"),
      ),
      body: Center(
        child: Column(
          children: getForms(myController),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, myController);
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.check),
      ),
    );
  }
}

FormCadastroContagem campos;

List<Widget> getForms(TextEditingController myController) {
  return [
    TextField(
      textInputAction: TextInputAction.none,
      autofocus: true,
      keyboardType: TextInputType.number,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      controller: myController,
      key: Key('n_contagem'),
      decoration: InputDecoration(
        labelText: 'Número da Contegem',
      ),
    ),
  ];
}

List<Widget> old_getForms() {
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
