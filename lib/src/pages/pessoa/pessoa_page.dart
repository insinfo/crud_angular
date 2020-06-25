import 'package:angular/angular.dart';
import 'package:crud_angular/src/models/pessoa.dart';
import 'package:crud_angular/src/services/pessoa_service.dart';
import 'package:essential_rest/essential_rest.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'pessoa-page',
    directives: [coreDirectives, formDirectives],
    templateUrl: 'pessoa_page.html')
class PessoaPage implements OnInit {
  var service = PessoaService();
  RList<Pessoa> pessoas;
  bool showModal = false;
  bool isNew = false;
  Pessoa pessoa;
  String result = '';
  String error = '';

  //carrega os dados na inicialização
  void load() async {
    var resp = await service.getAll();
    if (resp.status == RestStatus.SUCCESS) {
      pessoas = resp.dataTypedList;
    } else {
      result = resp.message;
      error = resp.exception;
    }
  }

  void select(Pessoa p) {
    p.isSelected = !p.isSelected;
  }

  void delete() async {
    var items = pessoas.where((i) => i.isSelected).toList();
    var resp = await service.deleteAll(items);
    if (resp.status == RestStatus.SUCCESS) {
      pessoas = resp.dataTypedList;
      load();
    } else {
      result = resp.message;
      error = resp.exception;
    }
  }

  @override
  void ngOnInit() {
    load();
  }

  void edit(Pessoa p) {
    pessoa = p;
    isNew = false;
    showModal = true;
  }

  void add(e) {
    pessoa = Pessoa();
    isNew = true;
    showModal = true;
  }

  void save(e) async {
    var resp;
    if (isNew) {
      resp = await service.create(pessoa);
    } else {
      resp = await service.update(pessoa);
    }

    if (resp.status == RestStatus.SUCCESS) {
      pessoas = resp.dataTypedList;
      result = 'SUCCESS';
      load();
    } else {
      result = 'FAILURE';
    }
    showModal = false;
  }
}
