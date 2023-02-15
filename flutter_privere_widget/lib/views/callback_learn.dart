// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/widget/answer_button.dart';
import 'package:flutter_privere_widget/widget/callback_dropdown.dart';
import 'package:flutter_privere_widget/widget/leading_button.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({Key? key}) : super(key: key);

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NNNNNNNaaaaaaber"),
      ),
      body: Column(
        children: [
          CallBackDropDown(
            onSelcetion: (user) {
              print(user);
            },
          ),
          AnswerButton(
            onNumber: (number) {
              return number % 3 == 1;
            },
          ),
          LoadingButton(
              title: "Save",
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 1));
              }),
        ],
      ),
    );
  }
}

class CallBackUser {
  final String name;
  final int id;

  CallBackUser(this.name, this.id);

  //TODO Dummy Remove it
  static List<CallBackUser> dumyUser() {
    return [
      CallBackUser("bura", 10),
      CallBackUser("ahmet", 11),
      CallBackUser("abd", 12),
    ];
  }

  @override
  bool operator ==(covariant CallBackUser other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}

//widget klasorunde altinda git callbackdropdown
