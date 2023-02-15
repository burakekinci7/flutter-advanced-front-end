class ServicesModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  ServicesModel({this.userId, this.id, this.title, this.body});

  //fromJosn kismina kod yazılmaz değiştirilemez sadece servisten al ver yapar!..
  ServicesModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  //toJosn kismina kod yazılmaz!..
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
