import 'dart:ui';

import 'package:contagem_inventario/Objects/Contagem.dart';
import 'package:flutter/material.dart';
import '../Objects/Contagens.dart';
import 'CadastroContagem.dart';

/*
  Listas
*/

//
Contagens contagens;

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    contagens = Contagens();
    return MaterialApp(
      title: 'Contagem Estoque',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuListPage(title: 'Contagem Estoque - Menu'),
    );
  }
}

class MenuListPage extends StatefulWidget {
  MenuListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MenuListPageState createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  void _select(Choice choice) {
    print(choice.title);
    if (choice.title == "Limpar Listas") {
      setState(() {
        contagens = new Contagens();
      });
    }
  }

  void updateListas(value) {
    print(value);
    setState(() {
      String name = "${value.text}";
      var c = Contagem(name, 0);
      contagens.add(c);
    });
  }

  List<Widget> listas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contagem"),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.skip(0).map((Choice choice) {
                return PopupMenuItem<Choice>(
                  enabled: choice.enable,
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: getLista(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => new CadastroContagem(context),
            ),
          ).then((value) => updateListas(value));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> getLista() {
    return [
      for (var c in contagens.getAll())
        Card(
          child: ListTile(
            leading: Icon(Icons.storage),
            title: Text("Contagem: ${c.namecontagem}"),
            subtitle: Text('QT Itens contados: ${c.qt_itens}'),
            trailing: Icon(Icons.more_vert),
          ),
        )
    ];
  }
}

class Choice {
  const Choice({this.title, this.enable});

  final String title;
  final bool enable;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Atualizar', enable: false),
  const Choice(title: 'Enviar Contagens', enable: false),
  const Choice(title: 'Limpar Listas', enable: true),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice, this.enable}) : super(key: key);

  final Choice choice;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
