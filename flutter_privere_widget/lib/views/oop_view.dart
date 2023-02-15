import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/views/oop.dart';

class OopView extends StatefulWidget {
  const OopView({Key? key}) : super(key: key);

  @override
  State<OopView> createState() => _OopViewState();
}

class _OopViewState extends State<OopView> {
  FileDownload? download;

  @override
  void initState() {
    super.initState();
    download = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CircularProgressIndicator(
            color: Colors.red,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          download?.downloadItem(null);
        },
      ),
    );
  }
}
