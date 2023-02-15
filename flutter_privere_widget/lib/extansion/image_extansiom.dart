import 'package:flutter/material.dart';

class ImageExtansion extends StatefulWidget {
  const ImageExtansion({Key? key}) : super(key: key);

  @override
  State<ImageExtansion> createState() => _ImageExtansionState();
}

class _ImageExtansionState extends State<ImageExtansion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImagePath.ic_flashex_logo.toWidget(),
    );
  }
}

enum ImagePath {
  ic_lock,
  ic_flashex_logo,
}

extension ImagePathExtension on ImagePath {
  String pathI() {
    return "assets/$name.jpg";
  }

  Widget toWidget() {
    return Image.asset(pathI());
  }
}
