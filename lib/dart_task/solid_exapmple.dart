void main() {
  RaceManager raceManager = RaceManager();

  raceManager.determineColor(Apple());
  raceManager.determineColor(Lemon());
  raceManager.determineColor(Strawberry());

  print("");

  raceManager.determineName(Apple());
  raceManager.determineName(Lemon());
  raceManager.determineName(Strawberry());
}

abstract class Fruit {
  void name();

  void color();
}

class Apple implements Fruit {
  @override
  void name() {
    print("This is an apple");
  }

  @override
  void color() {
    print("The color of the apple is red");
  }
}

class Lemon implements Fruit {
  @override
  void name() {
    print("This is an lemon");
  }

  @override
  void color() {
    print("The color of the lemon is yellow");
  }
}

class Strawberry implements Fruit {
  @override
  void name() {
    print("This is an strawberry");
  }

  @override
  void color() {
    print("The color of the strawberry is red");
  }
}

class RaceManager {
  determineName(Fruit fruitInfo) => fruitInfo.name();

  determineColor(Fruit fruitInfo) => fruitInfo.color();
}
