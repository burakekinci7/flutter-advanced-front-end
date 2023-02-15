import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/extansion/image_extansiom.dart';

class SheetUse extends StatefulWidget {
  const SheetUse({Key? key}) : super(key: key);

  @override
  State<SheetUse> createState() => _SheetUseState();
}

class _SheetUseState extends State<SheetUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("shett kullaınımı"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const CustomSheet();
              });
        },
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}

class CustomSheet extends StatelessWidget {
  const CustomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 40,
          child: Stack(
            children: [
              Center(
                child: Divider(
                  thickness: 4,
                  color: Colors.black,
                  indent: MediaQuery.of(context).size.width * 0.45,
                  endIndent: MediaQuery.of(context).size.width * 0.45,
                ),
              ),
              Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)))
            ],
          ),
        ),
        const Text("Sheet Title Kullanımı Gelin"),
        const SizedBox(
          child: ImageExtansion(),
          height: 200,
          width: 100,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Geri gel"))
      ],
    );
  }
}
