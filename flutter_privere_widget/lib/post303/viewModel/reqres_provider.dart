import 'package:flutter/cupertino.dart';
import 'package:flutter_privere_widget/post303/model/recuest_model.dart';
import 'package:flutter_privere_widget/post303/product303/global/recource_contex.dart';
import 'package:flutter_privere_widget/post303/service/reqrest_service.dart';

class ReqresrPovider extends ChangeNotifier {
  final IReqrestervice reqrestervice;
  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqresrPovider(this.reqrestervice) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqrestervice.fetcRecourcecItem())?.data ?? [];
    _changeLoading();
  }

  void saveToLocal(ResourceContex resourceContex) {
    resourceContex.saveModel(RecurceModel(data: resources));
  }
}
