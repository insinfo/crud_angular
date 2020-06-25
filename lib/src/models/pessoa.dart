class Pessoa {
  int id;
  String nome;
  String telefone;

  Pessoa();

  bool isSelected = false;

  Pessoa.fromJson(Map<String, dynamic> map) {
    //correção aqui converter string pra int
    id = int.tryParse(map['id'].toString());
    nome = map['nome'];
    telefone = map['telefone'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['nome'] = nome;
    map['telefone'] = telefone;
    return map;
  }
}
