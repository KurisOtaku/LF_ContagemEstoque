import 'Produto.dart';

class Contagem {
  String id;
  String namecontagem;
  int qt_itens;
  List<Produto> produtos;

  Contagem(String namecontagem) {
    qt_itens = 0;
    DateTime today = new DateTime.now();
    String dateSlug =
        "${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
    this.id =
        "${dateSlug}_${today.hour.toString()}:${today.minute.toString()}:${today.second.toString()}";
    this.namecontagem = "${dateSlug}_${namecontagem}";
    this.produtos = List<Produto>();
    this.qt_itens = qt_itens;
  }

  void add(Produto p) {
    this.produtos.add(p);
    this.qt_itens = this.produtos.length;
  }
}
