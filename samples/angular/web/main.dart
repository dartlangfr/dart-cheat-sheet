import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'rating_component.dart';

main() {
  applicationFactory()
  .rootContextType(RootContext) // Needed for assignment expression
  .addModule(new MyAppModule())
  .run();
}

dblClickHandler() {
  print("dblClickHandler");
}

class MyAppModule extends Module {
  MyAppModule() {
    install(new AnotherModule());
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

@Injectable()
class RootContext {
  bool visible = true;
  String name = "John Doe";
  bool bool_value;
  String selection;
  String lastEvent;
  String templateUrl;
  int rating;
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
