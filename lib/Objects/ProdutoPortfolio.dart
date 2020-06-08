class ProdutoPortfolio {
  int cod;

  String desc;

  int marca;

  int vasilhame;

  int garrafeira;

  String palmtop;

  ProdutoPortfolio(item) {
    this.cod = item['Codigo'] as int;
    this.desc = item['Descricao'] as String;
    this.marca = int.parse((item['Tipo Marca'] as String).split(" - ")[0]);
    this.vasilhame = item['Vasilhame'] as int;
    this.garrafeira = item['Garrafeira'] as int;
    this.palmtop = item['Ind Palmtop'] as String;
  }
}
