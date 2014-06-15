import 'dart:collection';

main() {
  testCollections();
  testIterable();
}

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
  even(i) => i % 2 == 0;
  single(i) => i == 50;
  double(i) => i * 2;
  expand(i) => [i, i + 1];
  sum(a, b) => a + b;

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
