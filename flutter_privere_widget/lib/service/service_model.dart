import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/service/post_service.dart';

class ServicePostGeneral extends StatefulWidget {
  const ServicePostGeneral({Key? key}) : super(key: key);

  @override
  State<ServicePostGeneral> createState() => _ServicePostGeneralState();
}

class _ServicePostGeneralState extends State<ServicePostGeneral> {
  List<ServicesModel>? _item;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = "https://jsonplaceholder.typicode.com/";

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    fetchPostItem();
  }

  Future<void> fetchPostItem() async {
    changeLoading();
    final responce =
        await Dio().get("https://jsonplaceholder.typicode.com/posts");

    if (responce.statusCode == HttpStatus.ok) {
      //bu islem basarılımı
      final _datas = responce.data;

      if (_datas is List) {
        setState(() {
          _item = _datas.map((e) => ServicesModel.fromJson(e)).toList();
        });
      }
    }
    changeLoading();
  }

  Future<void> fetchPostItemAdvance() async {
    changeLoading();
    final responce = await _dio.get("posts");

    if (responce.statusCode == HttpStatus.ok) {
      //bu islem basarılımı
      final _datas = responce.data;

      if (_datas is List) {
        setState(() {
          _item = _datas.map((e) => ServicesModel.fromJson(e)).toList();
        });
      }
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
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: _item?.length ?? 0,
        itemBuilder: (context, index) {
          return _PostCard(model: _item?[index]);
        },
      ),
    );
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
