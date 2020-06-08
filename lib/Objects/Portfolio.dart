import '../Requests/ApiTeste.dart';
import 'ProdutoPortfolio.dart';
import 'dart:convert';

class Portfolio {
  bool ready;

  bool isReady() => ready;
  String s_json;
  List<ProdutoPortfolio> portfolio;
  Portfolio() {
    s_json = jsonbackup();
    ready = false;
    portfolio = List<ProdutoPortfolio>();
    Request r = new Request();
    final futurejson = r.getPortfolio();
    futurejson.then((value) {
      s_json = value.body as String;
      build();
      return s_json;
    });
  }

  void printjson() {
    build();
  }

  String getbycod(int cod) {
    ProdutoPortfolio p = getProduto(cod);
    if (p != null) {
      return p.desc;
    } else {
      return "#produto não encontrado#";
    }
  }

  ProdutoPortfolio getProduto(cod) {
    for (var p in this.portfolio) {
      if (p.cod == cod) {
        return p;
      }
    }
    return null;
  }

  void build() {
    ready = false;
    portfolio = List<ProdutoPortfolio>();
    var j = json.decode(s_json);
    for (var item in j) {
      var p = ProdutoPortfolio(item);
      this.portfolio.add(p);
    }
    ready = true;
  }

  String jsonbackup() {
    return '[{"Codigo":1,"Descricao":"teste","Tipo Marca":"000 - Teste","Linha Marca":0,"Embalagem":"0 - Teste","Marca":0,"Vasilhame":0,"Garrrafeira":0,"Ind Palmtop":"S"}]';
  }
}
