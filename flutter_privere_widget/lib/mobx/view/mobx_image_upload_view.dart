import 'package:flutter/material.dart';

class MobxImageUpload extends StatefulWidget {
  const MobxImageUpload({Key? key}) : super(key: key);

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  final String _imageUploadLottiePath =
      "https://assets2.lottiefiles.com/packages/lf20_jihyrp3a.json";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Upload"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Card(
              elevation: 10,
              child: FittedBox(
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.upload_file)),
              ),
            ),
            flex: 4,
          ),
          const Divider(),
          const Spacer(flex: 6)
        ],
      ),
    );
  }
}
