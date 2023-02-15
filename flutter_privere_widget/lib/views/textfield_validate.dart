import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _globalKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              validator: FormFieldValidatora().isNotEmpty,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_globalKey.currentState?.validate() ?? false) {}
                },
                child: const Text("data"))
          ],
        ),
      ),
    );
  }
}

class FormFieldValidatora {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : "asbos gecilemez";
  }
}
