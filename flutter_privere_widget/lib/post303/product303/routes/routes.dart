import 'package:flutter_privere_widget/post303/lottie/lottie.dart';
import 'package:flutter_privere_widget/post303/route/navigate_home_view.dart';
import 'package:flutter_privere_widget/post303/route/navigate_home_detail.dart';

class Routes {
  static const _paragh = "/";
  final pages = {
    _paragh: (context) => const LottieLearn(),
    NavigateRoutes.home.withParagh: (context) => const NavigateHomeView(),
    NavigateRoutes.details.withParagh: (context) => const NavigateHomeDetails(),
  };
}

enum NavigateRoutes { home, details }

extension NavigateRoutesExtansion on NavigateRoutes {
  String get withParagh => "/$name";
}
