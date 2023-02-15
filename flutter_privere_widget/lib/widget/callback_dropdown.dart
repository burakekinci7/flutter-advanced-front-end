import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/views/callback_learn.dart';

class CallBackDropDown extends StatefulWidget {
  const CallBackDropDown({Key? key, required this.onSelcetion})
      : super(key: key);
  final Function(CallBackUser user) onSelcetion;
  @override
  State<CallBackDropDown> createState() => _CallBackDropDownState();
}

class _CallBackDropDownState extends State<CallBackDropDown> {
  CallBackUser? user;

  void _updateUser(CallBackUser? item) {
    setState(() {
      user = item;
    });
    if (user != null) {
      widget.onSelcetion.call(user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallBackUser>(
      value: user,
      items: CallBackUser.dumyUser().map((e) {
        return DropdownMenuItem(
          child: Text(e.name),
          value: e,
        );
      }).toList(),
      onChanged: _updateUser,
    );
  }
}
