class Money {
  int number;

  Money({required this.number});
}

class Moneybox {
  Moneybox({required this.summa});

  int summa;
  List<Money> _money = [];

  void addMoney(Money money) {
    _money.add(money);
  }

  bool isEmpty() => _money.isEmpty;

  void getMoneyCunt() => _money.length;
}
