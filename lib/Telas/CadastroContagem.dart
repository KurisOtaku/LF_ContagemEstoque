import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:contagem_inventario/Objects/FormCadastroContagem.dart';

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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
          if (validacampos(myController)) {
            Navigator.pop(context, myController);
          } else {
            _displaySnackBar(context);
          }
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.check),
      ),
    );
  }

  _displaySnackBar(BuildContext context) {
    final snackBar =
        SnackBar(content: Text('Preencher os campos com valor válido'));
    _scaffoldKey.currentState.showSnackBar(snackBar); //edited line
  }

  bool validacampos(TextEditingController myController) {
    var txt = myController.text;
    if (txt == "" || int.parse(txt) < 1) {
      return false;
    }
    return true;
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
