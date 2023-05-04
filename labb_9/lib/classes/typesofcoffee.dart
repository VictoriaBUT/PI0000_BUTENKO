import 'icoffee.dart';

class Espresso implements ICoffee {
  @override
  String name() => "Espresso";
  @override
  int coffeeBeans() => 50;
  @override
  int milk() => 0;
  @override
  int water() => 20;
  @override
  int cash() => 120;
}

class Capuchino implements ICoffee {
  @override
  String name() => "Capuchino";
  @override
  int coffeeBeans() => 20;
  @override
  int milk() => 50;
  @override
  int water() => 5;
  @override
  int cash() => 110;
}
class Doppio implements ICoffee {
  @override
  String name() => "Doppio";
  @override
  int coffeeBeans() => 50;
  @override
  int milk() => 0;
  @override
  int water() => 5;
  @override
  int cash() => 130;
}

class Latte implements ICoffee {
  @override
  String name() => "Latte";
  @override
  int coffeeBeans() => 20;
  @override
  int milk() => 50;
  @override
  int water() => 5;
  @override
  int cash() => 130;
}

class Makkiato implements ICoffee {
  @override
  String name() => "Makkiato";
  @override
  int coffeeBeans() => 60;
  @override
  int milk() => 10;
  @override
  int water() => 5;
  @override
  int cash() => 100;
}

class Americano implements ICoffee {
  @override
  String name() => "Americano";
  @override
  int coffeeBeans() => 20;
  @override
  int milk() => 10;
  @override
  int water() => 50;
  @override
  int cash() => 100;
}