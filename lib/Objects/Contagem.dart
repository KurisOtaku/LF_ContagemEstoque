class Contagem {
  int qt_itens;
  String namecontagem;

  Contagem(String namecontagem, int qt_itens) {
    DateTime today = new DateTime.now();
    String dateSlug =
        "${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
    this.namecontagem = "${dateSlug}_${namecontagem}";
    this.qt_itens = qt_itens;
  }
}
