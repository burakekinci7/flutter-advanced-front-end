import 'dart:typed_data';

import 'package:dio/dio.dart';

class ImageUploadService {
  final Dio dio;

  ImageUploadService(this.dio);
/* dio isntance
  var formData = FormData.fromMap({
  'name': 'wendux',
  'age': 25,
  'file': await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
  'files': [
    await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
    await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
  ]
});
var response = await dio.post('/info', data: formData); */

  Future<void> uploadToImageServer(Uint8List byteArray, String name) async {
    /*   var formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(byteArray),
    }); */
    await dio.post(
      "full%2F$name.png",
      data: byteArray,
      onSendProgress: (count, total) {},
    );
  }
}
