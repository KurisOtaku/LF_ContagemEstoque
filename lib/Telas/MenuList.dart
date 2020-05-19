import 'dart:ui';

import 'package:flutter/material.dart';
import '../Objects/Contagem.dart';
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
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {});
  }

  void select() {
    print("select");
    setState(() {
      contagens.add(new Contagem("Teste 1", 100));
      contagens.add(new Contagem("Teste 2", 333));
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
            MaterialPageRoute(builder: (context) => CadastroContagem()),
          );
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
  const Choice({this.title});

  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Atualizar'),
  const Choice(title: 'Enviar Contagens'),
  const Choice(title: 'Limpar Listas'),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

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
