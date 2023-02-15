import 'package:flutter/material.dart';

abstract class LoadingSatetful<T extends StatefulWidget> extends State<T> {
  bool isLoaing = false;
  void cahngeLoading() {
    setState(() {
      isLoaing = !isLoaing;
    });
  }
}
