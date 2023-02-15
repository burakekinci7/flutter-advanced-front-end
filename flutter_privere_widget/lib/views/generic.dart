class UserManagement<T extends Admin> {
  final T admin;

  UserManagement(this.admin);
  void userName(User user) {
    print(user.name);
  }

  int calculateMoney(List<User> users) {
    int sum = 0;
    for (var item in users) {
      sum += item.money;
    }
    print(sum);

    int initialVAlue = admin.role == 1 ? admin.money : 0;

    final sumMoney = users.map((e) => e.money).fold<int>(
        initialVAlue, (previousValue, element) => previousValue + element);
    print(sumMoney);

    final money = users.fold<int>(
        0, (previousValue, element) => previousValue + element.money);
    print(money);

    return sumMoney;
  }
}

class User {
  final String name;
  final String id;
  final int money;

  User(this.name, this.id, this.money);
}

class Admin extends User {
  final int role;
  Admin(String name, String id, int money, this.role) : super(name, id, money);
}
