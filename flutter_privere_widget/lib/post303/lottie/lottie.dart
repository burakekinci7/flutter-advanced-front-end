import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/post303/product303/constant/durations_item.dart';
import 'package:flutter_privere_widget/post303/product303/constant/lottie_theme.dart';
import 'package:flutter_privere_widget/post303/product303/global/theme_notifier.dart';
import 'package:flutter_privere_widget/post303/product303/routes/routes.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({Key? key}) : super(key: key);

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn>
    with TickerProviderStateMixin {
  //veriable
  final _loadingLottie =
      "https://assets5.lottiefiles.com/packages/lf20_usmfx6bp.json";
  //controller
  late AnimationController animationController;
  //dark and liglhtl mode bool
  bool isLight = false;

  void onChanged() {
    isLight = !isLight;
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushNamed(NavigateRoutes.home.withParagh);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Lottie.asset(
              LottieItems.themeCahnge.lottiePath,
              repeat: false,
              controller: animationController,
            ),
            onTap: () async {
              await animationController.animateTo(isLight ? 1 : 0.5);
              onChanged();
              context.read<ThemeNotifier>().chnageTheme();
            },
          ),
        ],
      ),
      body: LoadingLottie(loadingLottie: _loadingLottie),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    Key? key,
    required String loadingLottie,
  })  : _loadingLottie = loadingLottie,
        super(key: key);

  final String _loadingLottie;

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(_loadingLottie));
  }
}
