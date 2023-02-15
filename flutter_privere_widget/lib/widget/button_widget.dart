import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/extansion/colors.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.padding})
      : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: ColorCustom.pink, shape: const StadiumBorder()),
      child: Padding(
        padding: padding,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: ColorCustom.white),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
