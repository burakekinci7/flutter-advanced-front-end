import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

import 'oop_exception.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  void toShare(String path) async {
    !await launch(path);
  }
}

class FileDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem != null) throw FileDownloadExceptionA();
    print("a");
    return true;
  }

  @override
  void toShare(String path) {}
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}
