import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_privere_widget/post303/model/recuest_model.dart';

abstract class IReqrestervice {
  final Dio _dio;
  IReqrestervice(this._dio);
  Future<RecurceModel?> fetcRecourcecItem();
}

enum _ReqResPath { resource }

class ReqresService extends IReqrestervice {
  ReqresService(Dio dio) : super(dio);

  @override
  Future<RecurceModel?> fetcRecourcecItem() async {
    final responce = await _dio.get('/${_ReqResPath.resource.name}');
    if (responce.statusCode == HttpStatus.ok) {
      final jsonBody = responce.data;
      if (jsonBody is Map<String, dynamic>) {
        return RecurceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
