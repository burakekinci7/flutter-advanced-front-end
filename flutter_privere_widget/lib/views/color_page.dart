import 'package:flutter/material.dart';

class ColorsPage extends StatefulWidget {
  const ColorsPage({Key? key}) : super(key: key);

  @override
  State<ColorsPage> createState() => _ColorsPageState();
}

class _ColorsPageState extends State<ColorsPage> {
  Color _backgroundColor = Colors.red;

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapPageColor,
        items: [
          _colorContainer("red", Colors.red),
          _colorContainer("yellow", Colors.yellow),
          _colorContainer("blue", Colors.blue),
        ],
      ),
    );
  }

  void _onTapPageColor(value) {
    if (value == PageColor.red.index) {
      changeBackgroundColor(Colors.red);
    } else if (value == PageColor.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    } else if (value == PageColor.blue.index) {
      changeBackgroundColor(Colors.blue);
    }
  }

  //navigaton bar items
  BottomNavigationBarItem _colorContainer(String label, Color color) {
    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        height: 10,
        width: 10,
        color: color,
      ),
    );
  }
}

enum PageColor { red, yellow, blue }
