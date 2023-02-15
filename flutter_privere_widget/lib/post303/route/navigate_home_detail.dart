import 'package:flutter/material.dart';

class NavigateHomeDetails extends StatefulWidget {
  const NavigateHomeDetails({Key? key, this.id}) : super(key: key);
  final String? id;

  @override
  State<NavigateHomeDetails> createState() => _NavigateHomeDetailsState();
}

class _NavigateHomeDetailsState extends State<NavigateHomeDetails> {
  String? _id;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final _modelId = ModalRoute.of(context)?.settings.arguments;
      setState(() {
        _id = _modelId is String ? _modelId : _id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_id ?? "")),
    );
  }
}
