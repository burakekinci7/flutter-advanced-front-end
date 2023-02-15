import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/post303/product303/routes/routes.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({Key? key}) : super(key: key);

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(NavigateRoutes.details.withParagh, arguments: "abc");
        },
        child: const Icon(Icons.redo_rounded),
      ),
      appBar: AppBar(title: Text(toString())),
    );
  }
}
