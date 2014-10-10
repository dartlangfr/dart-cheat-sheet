import 'dart:collection';

main() {
  testCollections();
  testIterable();
  testList();
}

even(i) => i % 2 == 0;
single(i) => i == 50;
double(i) => i * 2;
expand(i) => [i, i + 1];
sum(a, b) => a + b;

testCollections() {
  new List();

  new Set();
  new HashSet();
  new LinkedHashSet();
  new SplayTreeSet();

  new Map();
  new HashMap();
  new LinkedHashMap();
  new SplayTreeMap();

  // TODO: add in cheat sheet
  new Queue();
  new ListQueue();
  new DoubleLinkedQueue();

  // TODO: add in cheat sheet
  new LinkedHashMap();
  new LinkedHashSet();
  new LinkedList();

  // TODO: add in cheat sheet
  Maps.mapToString({});
  // Maps. ...
}

testIterable() {
  var c = new Iterable.generate(100, (i) => i);
  c
      ..isEmpty
      ..isNotEmpty
      ..iterator
      ..length
      ..first
      ..where(single).single
      ..last
      ..elementAt(1)
      ..firstWhere(even)
      ..lastWhere(even)
      ..singleWhere(single)
      ..contains(42)
      ..any(even)
      ..every(even)
      ..map(double)
      ..expand(expand)
      ..where(even)
      ..forEach(double)
      ..skip(10)
      ..skipWhile(even)
      ..take(10)
      ..takeWhile(even)
      ..reduce(sum)
      ..fold(0, sum)
      ..join(", ")
      ..toList()
      ..toSet();
}

testList() {
  var l = new List.generate(100, (i) => i);
  l
      ..[0]
      ..[0] = 123
      ..add(42)
      ..addAll([1, 2, 3])
      ..insert(0, 666)
      ..insertAll(0, [1, 2, 3])
      ..setAll(0, [1, 2, 3])
      ..fillRange(0, 3, 42)
      ..replaceRange(0, 3, [1, 2, 3])
      ..setRange(0, 3, [1, 2, 3])
      ..reversed
      ..sublist(0, 2)
      ..sort()
      ..asMap()
      ..indexOf(42)
      ..lastIndexOf(42)
      ..remove(42)
      ..removeAt(0)
      ..removeLast()
      ..removeRange(0, 1)
      ..retainWhere(even)
      ..clear();
}
