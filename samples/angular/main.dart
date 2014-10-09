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
    bind(RouteInitializerFn, toValue: initRoutes);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));
    // TODO: working examples
    //    bindByKey(KeyToBind);
  }

  initRoutes(Router router, RouteViewFactory views) {
    views.configure({
      'recipes': ngRoute(path: '/recipes', view: 'template1.html'),
      'viewRecipe': ngRoute(path: '/recipe/:recipeId/view', view: 'template2.html'),
    });
  }
}
class AnotherModule extends Module {
  AnotherModule() {
  }
}

@Decorator(selector: '[tooltip]', map: const {
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

// FIXME: publishAs is deprecated
@Component(selector: 'rating', templateUrl: 'rating_component.html', cssUrl: 'rating_component.css', map: const {
  'rating': '<=>rating',
  'max-rating': '=>maxRating'
}, publishAs: 'cmp')
class RatingComponent {
  List<bool> stars = new List.generate(5, (i) => i + 1);

  int rating;
  int maxRating;
}

//FIXME: replace with @Component?
@Controller(selector: '[recipe-book]', publishAs: 'ctrl')
class RecipeBookController {
  String data = "Hello World!";
}
