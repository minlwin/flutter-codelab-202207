import 'dart:ffi';

class Divisions {
  Divisions._();

  static Divisions of() {
    return _instance;
  }

  static final Divisions _instance = Divisions._();

  final List<String> _list = List.empty(growable: true);

  get list => List.of(_list);

  add(String division) {
    _list.add(division);
  }
}
