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
    // TODO: working examples
    //    bind(TypeToBind);
    //    bindByKey(KeyToBind);
  }
}
class AnotherModule extends Module {
  AnotherModule() {
  }
}
