library dart_cheat_sheet.keywords;

import 'dart:math' deferred as math;

export 'dart:math' hide log;
export 'dart:math' show E;

export 'dart:math';

class MyClass {}

enum Color { red, green, blue }

testKeywords() {
  _if();
  // TODO: all others...
  _asyncAwait();
}

void _if() {
  var s = "42";
  if (s == 42) {
    print("int");
  } else if (s == "42") {
    print("string");
  } else {
    print("unknown");
  }
}

_asyncAwait() async {
  foo() async => 42;

  print(await foo());
}
