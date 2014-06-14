import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

main() {
  applicationFactory().addModule(new MyAppModule()).run();
}

dblClickHandler() {
  print("dblClickHandler");
}

class MyAppModule extends Module {
  MyAppModule() {
    install(new AnotherModule());
    bind(RecipeBookController);
    bind(Tooltip);
    // TODO: working examples
    //    bindByKey(KeyToBind);
  }
}
class AnotherModule extends Module {
  AnotherModule() {
  }
}

@Decorator(
  selector: '[tooltip]', 
  map: const {
    'tooltip': '@text'
  })
class Tooltip {
  final Element element;

  String text;

  Tooltip(this.element) {
    element
        ..onMouseEnter.listen((_) => element.text = "Tooltip: $text")
        ..onMouseLeave.listen((_) => element.text = "Tooltip");
  }
}

@Controller(
    selector: '[recipe-book]',
    publishAs: 'ctrl')
class RecipeBookController {
  String data = "Hello World!";
}