import 'package:dio/dio.dart';

class ProjectDio {
  final servide = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));
}
