import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/post303/model/recuest_model.dart';
import 'package:flutter_privere_widget/post303/product303/extansion/color_hex_extansion.dart';
import 'package:flutter_privere_widget/post303/product303/global/recource_contex.dart';
import 'package:flutter_privere_widget/post303/product303/global/theme_notifier.dart';
import 'package:flutter_privere_widget/post303/product303/preject_dio.dart';
import 'package:flutter_privere_widget/post303/service/reqrest_service.dart';
import 'package:flutter_privere_widget/post303/viewModel/reqres_provider.dart';
import 'package:provider/provider.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({Key? key}) : super(key: key);

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

/* class _ReqresViewState extends ReqresViewModel { */
class _ReqresViewState extends State<ReqresView> with ProjectDio {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ReqresrPovider(ReqresService(servide)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifier>().chnageTheme();
            },
            child: const Icon(Icons.light_mode),
          ),
          appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      context
                          .read<ReqresrPovider>()
                          .saveToLocal(context.read<ResourceContex>());
                    },
                    icon: const Icon(Icons.ad_units))
              ],
              title: context.watch<ReqresrPovider>().isLoading
                  ? const CircularProgressIndicator()
                  : null),
          body: Column(
            children: [
              Selector<ReqresrPovider, bool>(builder: (context, value, child) {
                return value ? const Placeholder() : const Text("data");
              }, selector: (context, providerr) {
                return providerr.isLoading;
              }),
              Expanded(
                child: resourceListview(
                    context, context.watch<ReqresrPovider>().resources),
              ),
            ],
          ),
        );
      },
    );
  }

  ListView resourceListview(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            color: Color(items[index].color?.colorValue ?? 0),
            child: Text(items[index].name ?? ""));
      },
    );
  }
}
