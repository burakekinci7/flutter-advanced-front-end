import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({Key? key, this.onNumber}) : super(key: key);
  final bool Function(int number)? onNumber;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  //bir random sayi don bu sayiyi kontrol edip sana cevap vereyim
  //bu cevaba gore button rengine guncelle
  //eger dogruysa green yanlıs ise red
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: _backgroundColor),
      child: const Text("answe boyuun"),
      onPressed: () {
        final result = Random().nextInt(10);
        final responce = widget.onNumber?.call(result) ?? false;
        setState(() {
          _backgroundColor = responce ? Colors.green : Colors.red;
        });
      },
    );
  }
}

//calbacklearn da kullandik
