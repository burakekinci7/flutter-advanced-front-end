import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage extends StatefulWidget {
  const SecureStorage({Key? key}) : super(key: key);

  @override
  State<SecureStorage> createState() => _SecureStorageState();
}

enum KeySecure { token }

class _SecureStorageState extends State<SecureStorage> {
  // Create storage
  final storage = const FlutterSecureStorage();

  String _title = "";

  void onChngeTitle(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getSecureItem();
  }

  Future<void> getSecureItem() async {
    _title =
        await storage.read(key: KeySecure.token.name) ?? "kayit yok yada hata";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await storage.write(key: KeySecure.token.name, value: _title);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: const InputDecoration(border: OutlineInputBorder()),
          onChanged: onChngeTitle,
        ),
      ),
    );
  }
}
