import 'package:crud_angular/src/models/pessoa.dart';
import 'package:essential_rest/essential_rest.dart';
import 'dart:async';

class PessoaService {
  RestClientGeneric rest;

  PessoaService() {
     //correção aqui não esquecer de colocar o tipo do generic <Pessoa>
    rest = RestClientGeneric<Pessoa>(factory: {Pessoa: (x) => Pessoa.fromJson(x)});
    //endereço do backend
    //http://127.0.0.1:3000/
    rest.port = 3000;
    rest.host ='127.0.0.1';
    rest.protocol = ProtocolType.http;
    rest.basePath = '';
  }

  Future<RestResponseGeneric> getAll() {
    return rest.getAll('/pessoas',queryParameters:{});
  }

  Future<RestResponseGeneric> create(Pessoa pessoa) {
    return rest.post('/pessoas', body: pessoa.toJson());
  }

  Future<RestResponseGeneric> update(Pessoa pessoa) {
    return rest.put('/pessoas/${pessoa.id}', body: pessoa.toJson());
  }

  Future<RestResponseGeneric> deleteAll(List<Pessoa> pessoas) {
    return rest.deleteAll('/pessoas',
        body: pessoas.map((i) => i.toJson()).toList());
  }
}
