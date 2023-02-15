import 'package:flutter_privere_widget/views/generic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test("simple test", () {
    final users = [
      User("burak", "10", 10),
      User("ekinci", "11", 11),
    ];
    final result =
        UserManagement(Admin("rbe", "10", 20, 1)).calculateMoney(users);
    expect(result, 41);
  });
}
