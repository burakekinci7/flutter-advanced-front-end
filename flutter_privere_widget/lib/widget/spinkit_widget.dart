import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinkitLoadingBar extends StatelessWidget {
  const SpinkitLoadingBar({Key? key, this.size}) : super(key: key);
  final double? size;
  final double _defaultSize = 45.0;

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: Colors.red,
      size: size ?? _defaultSize,
    );
  }
}
