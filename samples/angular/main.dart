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
    bind(RatingComponent);
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

@Component(
  selector: 'rating',
  map: const {
    'rating': '<=>rating',
    'max-rating': '=>maxRating'
  },
  templateUrl: 'rating_component.html',
  cssUrl: 'rating_component.css',
  publishAs: 'cmp')
class RatingComponent {
  List<bool>  stars = new List.generate(5, (i) => i + 1);
  
  int rating;
  int maxRating;
}

//@Component?
@Controller(
  selector: '[recipe-book]',
  publishAs: 'ctrl')
class RecipeBookController {
  String data = "Hello World!";
}