import 'package:dio/dio.dart';
import 'package:flutter_privere_widget/post303/model/recuest_model.dart';
import 'package:flutter_privere_widget/post303/product303/preject_dio.dart';
import 'package:flutter_privere_widget/post303/service/reqrest_service.dart';
import 'package:flutter_privere_widget/post303/view/reqres_view.dart';
import 'package:flutter_privere_widget/post303/viewModel/loading_state.dart';

abstract class ReqresViewModel extends LoadingSatetful<ReqresView>
    with ProjectDio {
  late final IReqrestervice reqrestervice;
  List<Data> resources = [];
  @override
  void initState() {
    super.initState();
    reqrestervice = ReqresService(ProjectDio().servide);
    _fetch();
  }

  Future<void> _fetch() async {
    cahngeLoading();
    resources = (await reqrestervice.fetcRecourcecItem())?.data ?? [];
    cahngeLoading();
  }
}
