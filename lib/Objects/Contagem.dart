class Contagem {
  int qt_itens;
  String namecontagem;
  String id;

  Contagem(String namecontagem) {
    qt_itens = 0;
    DateTime today = new DateTime.now();
    String dateSlug =
        "${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
    this.id =
        "${dateSlug}_${today.hour.toString()}:${today.minute.toString()}:${today.second.toString()}";
    this.namecontagem = "${dateSlug}_${namecontagem}";
    this.qt_itens = qt_itens;
  }
}
