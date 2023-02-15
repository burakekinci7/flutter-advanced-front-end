import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/package/launch_manager.dart';
import 'package:flutter_privere_widget/widget/spinkit_widget.dart';

class PackageUseTo extends StatefulWidget {
  const PackageUseTo({Key? key}) : super(key: key);

  @override
  State<PackageUseTo> createState() => _PackageUseToState();
}

class _PackageUseToState extends State<PackageUseTo> with LauchManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launcherUrlN("https://pub.dev/packages/url_launcher");
        },
      ),
      body: const SpinkitLoadingBar(),
    );
  }

  @override
  void name(args) {}
}
