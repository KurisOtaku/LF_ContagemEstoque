import 'Contagem.dart';

class Contagens {
  List<Contagem> contagens;

  Contagens() {
    contagens = new List<Contagem>();
  }

  void add(Contagem contagem) {
    this.contagens.add(contagem);
  }

  List<Contagem> getAll() {
    return this.contagens;
  }

  void delete(String id) {
    for (Contagem c in contagens) {
      print(c.id);
      print(id);
      if (c.id.contains(id)) {
        contagens.remove(c);
        return;
      }
    }
  }

  Contagem _find(String id) {}
}
