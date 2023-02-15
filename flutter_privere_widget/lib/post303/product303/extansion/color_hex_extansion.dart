extension ColorHexExtansion on String? {
  int get colorValue {
    var _nweColor = this?.replaceFirst('#', '0xff') ?? "";

    return int.parse(_nweColor);
  }
}
