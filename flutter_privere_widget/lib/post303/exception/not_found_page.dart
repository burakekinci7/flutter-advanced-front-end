import 'package:flutter/material.dart';

class PageError extends StatelessWidget {
  const PageError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _title = "Sayfa Bulunamadi",
        _notPageText = "Yanliş Sayfaya. Aradiğiniz Sayfa Bulunamadi";
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Text(
          _notPageText,
          style: const TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}
