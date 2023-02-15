import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/mobx/view/mobx_image_upload_view.dart';
import 'package:flutter_privere_widget/post303/exception/not_found_page.dart';
import 'package:flutter_privere_widget/post303/lottie/lottie.dart';
import 'package:flutter_privere_widget/post303/product303/constant/project_items.dart';
import 'package:flutter_privere_widget/post303/product303/global/recource_contex.dart';
import 'package:flutter_privere_widget/post303/product303/global/theme_notifier.dart';
import 'package:flutter_privere_widget/post303/product303/routes/routes.dart';
import 'package:flutter_privere_widget/post303/view/reqres_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: ((context) => ResourceContex())),
        ChangeNotifierProvider<ThemeNotifier>(
            create: (context) => ThemeNotifier()),
      ],
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genel',
      theme: context.watch<ThemeNotifier>().currentTheme,
      /* ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorCustom.grey,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: ColorCustom.black),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.greenAccent)), */
      home: const MobxImageUpload(),
      /*    routes: Routes().pages,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return const PageError();
          },
        );
      }, */
    );
  }
}
