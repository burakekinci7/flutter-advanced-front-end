import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/widget/button_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ButtonCustom(
            onPressed: () {},
            title: "Normal button",
            padding: const EdgeInsets.all(10),
          )
        ],
      ),
    );
  }
}
