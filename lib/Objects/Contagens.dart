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
}
