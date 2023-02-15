import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/model/post_model.dart';

class ModelView extends StatefulWidget {
  const ModelView({Key? key}) : super(key: key);

  @override
  State<ModelView> createState() => _ModelViewState();
}

class _ModelViewState extends State<ModelView> {
  var user9 = PostModel8(title: "user9 Bdoy");

  @override
  void initState() {
    super.initState();
    //PostModel
    final user1 = PostModel()
      ..body = "1"
      ..title = "1";
    user1.id = 1;

    //2 final olmadigi icin update edilerbilir*
    final user2 = PostMode2(2, 2, "2", "2");
    user2.id = 22; //*

    //3 final verildiği için değiştirme yapılamaz
    final user3 = PostMode3(3, 3, "3", "3");
    // user3.body = "a"; X

    //4
    final user4 = PostMode4(userID: 4, id: 4, title: "4", body: "4");

    //5 private verdiğimiz için nesneler erişim yok
    final user5 = PostMode5(userID: 5, id: 5, title: "5", body: "5");
    //user5. X
    user5.userID;

    //6 private verdiğimiz için nesneler erişim yok
    final user6 = PostMode6(userID: 6, id: 6, title: "6", body: "6");
    //user6.   X

    //7
    final user7 = PostMode7();
    //user7.  X

    //services
    final user8 = PostModel8(userId: 8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            user9 = user9.copyWith(title: "on pressed");
            user9.bodyUpdate("dataupadate body");
          });
        },
        child: const Icon(Icons.read_more),
      ),
      appBar: AppBar(
        title: Text(
          user9.body ?? "asdasdasd",
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

//bir database doğrudan erişebilir misniz?
//-evet erisebilirim ama erismek istemem çünkü güvenlik acigi olusabilir
//-sen bana servis yada api gibi bir katman ver ben bunu service ler araciligiyla eriseyim.
