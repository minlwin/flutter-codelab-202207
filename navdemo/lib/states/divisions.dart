class Divisions {
  Divisions._();
  static final Divisions _instance = Divisions._();

  static Divisions get instance => _instance;

  int _id = 0;

  final List<Division> _list = <Division>[];

  List<Division> get list => List.of(_list);

  add(String division) {
    _list.add(Division(++_id, division));
  }
}

class Division {
  final int id;
  final String name;

  Division(this.id, this.name);
}
