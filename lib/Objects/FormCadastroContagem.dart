class FormCadastroContagem {
  List<CampoFormulario> campos;

  FormCadastroContagem() {
    this.campos = new List<CampoFormulario>();
  }

  void add({String key, String descricao, String value}) {
    campos.add(CampoFormulario(key, descricao, value: value));
  }

  List<CampoFormulario> getAll() {
    return this.campos;
  }

  void init() {
    campos.add(CampoFormulario("n_contagem", "Número da Contegem"));
  }
}

class CampoFormulario {
  String key;
  String descricao;
  var value;

  CampoFormulario(String key, String descricao, {value}) {
    this.key = key;
    this.descricao = descricao;
    this.value = value;
  }
}
