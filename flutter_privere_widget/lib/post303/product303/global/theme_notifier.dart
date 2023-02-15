import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLighyTheme = true;

  void chnageTheme() {
    isLighyTheme = !isLighyTheme;
    notifyListeners();
  }

  ThemeData get currentTheme =>
      isLighyTheme ? ThemeData.light() : ThemeData.dark();
}
