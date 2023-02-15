import 'package:dio/dio.dart';

class NeteworkManager {
  late final Dio _dio;
  NeteworkManager._() {
    _dio = Dio(BaseOptions(baseUrl: "pub.dev"));
    _dio.options = BaseOptions();
  }

  static NeteworkManager instance = NeteworkManager._();

  Dio get serviceDio => _dio;

  void addBaseOptions(String token) {
    _dio.options = _dio.options.copyWith(headers: {"Auth": token});
  }
}

class DurationManager {
  DurationManager._();
  static DurationManager? _manager;

  static DurationManager get manager {
    if (_manager != null) return _manager!;
    _manager = DurationManager._();
    return _manager!;
  }
}
