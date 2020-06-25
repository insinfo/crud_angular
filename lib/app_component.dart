import 'package:angular/angular.dart';
import 'package:crud_angular/src/pages/pessoa/pessoa_page.dart';



// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [PessoaPage],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
