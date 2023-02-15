// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostModel {
  int? userID;
  int? id;
  String? title;
  String? body;
}

class PostMode2 {
  int userID;
  int id;
  String title;
  String body;

  PostMode2(this.userID, this.id, this.title, this.body);
}

class PostMode3 {
  final int userID;
  final int id;
  final String title;
  final String body;

  PostMode3(this.userID, this.id, this.title, this.body);
}

class PostMode4 {
  int userID;
  int id;
  String title;
  String body;

  PostMode4({
    required this.userID,
    required this.id,
    required this.title,
    required this.body,
  });
}

class PostMode5 {
  final int _userID;
  final int _id;
  final String _title;
  final String _body;

  int get userID => _userID;

  PostMode5({
    required int userID,
    required int id,
    required String title,
    required String body,
  })  : _userID = userID,
        _id = id,
        _title = title,
        _body = body;
}

class PostMode6 {
  late final int _userID;
  late final int _id;
  late final String _title;
  late final String _body;

  PostMode6({
    required int userID,
    required int id,
    required String title,
    required String body,
  })  : _userID = userID,
        _id = id,
        _title = title,
        _body = body;
}

class PostMode7 {
  late final int _userID;
  late final int _id;
  late final String _title;
  late final String _body;

  PostMode7({
    int userID = 0,
    int id = 0,
    String title = "",
    String body = "",
  }) {
    _userID = userID;
    _id = id;
    _title = title;
    _body = body;
  }
}

//**Favori genel kullanim
class PostModel8 {
  final int? userId;
  final int? id;
  final String? title;
  String? body;

  PostModel8({this.userId, this.id, this.title, this.body});

  void bodyUpdate(String? data) {
    if (data != null && data.isNotEmpty) {
      body = data;
    }
  }

  //copyWith methodu bu nesnedeki bir elemanı değiştrimek istediğimizde.
  //sadece değişen elemanı değiştirir geriye kalan tüm elemanlerı eski değerine atama yaoar.
  PostModel8 copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
