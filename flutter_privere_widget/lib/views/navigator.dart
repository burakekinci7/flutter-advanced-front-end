import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/home_page.dart';

class NavigatorPushPage extends StatefulWidget {
  const NavigatorPushPage({Key? key}) : super(key: key);

  @override
  State<NavigatorPushPage> createState() => _NavigatorPushPageState();
}

class _NavigatorPushPageState extends State<NavigatorPushPage>
    with NavigatorMenager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToPushWidget(context, const MyHomePage());
        },
        child: const Icon(Icons.back_hand_outlined),
      ),
    );
  }
}

mixin NavigatorMenager {
  void navigateToPushWidget(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
