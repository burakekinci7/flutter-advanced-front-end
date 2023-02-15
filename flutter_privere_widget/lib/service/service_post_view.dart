import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/service/post_service.dart';

class ServicePostView extends StatefulWidget {
  const ServicePostView({Key? key}) : super(key: key);

  @override
  State<ServicePostView> createState() => _ServicePostViewState();
}

class _ServicePostViewState extends State<ServicePostView> {
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = "https://jsonplaceholder.typicode.com/";

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIDController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void addItemToService(ServicesModel servicesModel) async {
    changeLoading();

    final responce = await _dio.post("posts", data: servicesModel);

    if (responce.statusCode == HttpStatus.created) {
      name = "başarlii";
    }
    changeLoading();
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox()
          ],
        ),
        body: Column(
          children: [
            TextField(
                textInputAction: TextInputAction.next,
                controller: _titleController,
                decoration: const InputDecoration(labelText: "titles")),
            TextField(
                textInputAction: TextInputAction.next,
                controller: _bodyController,
                decoration: const InputDecoration(labelText: "body")),
            TextField(
              controller: _userIDController,
              decoration: const InputDecoration(labelText: "userID"),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        if (_titleController.text.isNotEmpty &&
                            _bodyController.text.isNotEmpty &&
                            _userIDController.text.isNotEmpty) {
                          final model = ServicesModel(
                              body: _bodyController.text,
                              title: _titleController.text,
                              userId: int.tryParse(_userIDController.text));
                          addItemToService(model);
                        }
                      },
                child: const Text("Sent"))
          ],
        ));
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required ServicesModel? model,
  })  : _model = model,
        super(key: key);

  final ServicesModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model?.title ?? ""),
        subtitle: Text(_model?.body ?? ""),
      ),
    );
  }
}
