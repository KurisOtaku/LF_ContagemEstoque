import 'package:contagem_inventario/Objects/Portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Objects/Contagem.dart';
import '../Objects/Produto.dart';

class ContagemItens extends StatelessWidget {
  final BuildContext context;
  final Contagem contagem;
  final Portfolio portfolio;

  ContagemItens(this.context, this.contagem, this.portfolio);
  @override
  Widget build(BuildContext context) {
    return ContagemItensPage(
        title: 'Contagem Estoque - Menu', contagem: contagem);
  }
}

class ContagemItensPage extends StatefulWidget {
  Contagem contagem;
  Portfolio portfolio;
  ContagemItensPage({Key key, this.title, this.contagem, this.portfolio})
      : super(key: key);

  final String title;

  @override
  _ContagemItensPageState createState() {
    _ContagemItensPageState c = _ContagemItensPageState();
    c._setContagem(contagem);
    c._setPortfolio(portfolio);
    return c;
  }
}

class _ContagemItensPageState extends State<ContagemItensPage> {
  Contagem contagem;

  Portfolio portfolio;
  //FIELDS
  final tec_cod = TextEditingController();
  final tec_pallet = TextEditingController();
  final tec_lastro = TextEditingController();
  final tec_cx = TextEditingController();
  final tec_un = TextEditingController();

  String descfield;

  @override
  Widget build(BuildContext context) {
    descfield = "_____";
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contagem ${contagem.namecontagem}"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _salvaProduto(
                tec_cod.text,
                tec_pallet.text,
                tec_lastro.text,
                tec_cx.text,
                tec_un.text,
              );
              _clearLista(
                tec_cod,
                tec_pallet,
                tec_lastro,
                tec_cx,
                tec_un,
              );
            });
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text("Item: ${contagem.qt_itens + 1} $descfield"),
                  ),
                  TextFormField(
                    // COD
                    onChanged: (value) => replacenameprodut(value),
                    controller: tec_cod,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Codigo Produto',
                    ),
                    textInputAction: TextInputAction.go,
                  ),
                  TextFormField(
                    // PALLETS
                    controller: tec_pallet,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Pallets',
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    //  LASTROS
                    controller: tec_lastro,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Lastros',
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    // CX / Fd
                    controller: tec_cx,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Cx/fd',
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    //  UN
                    controller: tec_un,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'UN',
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _setContagem(Contagem contagem) => this.contagem = contagem;

  void _setPortfolio(Portfolio portfolio) => this.portfolio = portfolio;

  void _salvaProduto(
      String cod, String pallet, String lastro, String cx, String un) {
    Produto p = Produto(cod: int.parse(cod));
    p.addQt(
      pallet: pallet,
      lastro: lastro,
      cx: cx,
      un: un,
    );
    this.contagem.add(p);
  }

  void _clearLista(
      TextEditingController tec_cod,
      TextEditingController tec_pallet,
      TextEditingController tec_lastro,
      TextEditingController tec_cx,
      TextEditingController tec_un) {
    tec_cod.clear();
    tec_pallet.clear();
    tec_lastro.clear();
    tec_cx.clear();
    tec_un.clear();
  }

  replacenameprodut(value) {
    setState(() {
      this.descfield = "$value";
    });
  }
}

class MenuList extends StatelessWidget {
  const MenuList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("teste"),
    );
  }
}

String numberValidator(String value) {
  if (value == null) {
    return null;
  }
  final n = num.tryParse(value);
  if (n == null) {
    return '"$value" is not a valid number';
  }
  return null;
}
