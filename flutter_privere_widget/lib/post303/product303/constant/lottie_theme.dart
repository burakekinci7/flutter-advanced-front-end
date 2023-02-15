enum LottieItems { themeCahnge }

extension LottieItemsExtansion on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.themeCahnge:
        return "lottie_theme";
    }
  }

  String get lottiePath => "assets/${_path()}.json";
}
