import 'package:url_launcher/url_launcher.dart';

mixin LauchManager {
  void launcherUrlN(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(urlString);
    }
  }

  void name(args);
}
