import 'package:flutter/material.dart';
import 'package:flutter_privere_widget/cache/shared_menager.dart';

//uygulamyi silip tekrar yukledigimizde tum datalar gider
//keyChain ile kaydedersek uygulamayi silsekte data lar gitmez

class SharedPrefencesUse extends StatefulWidget {
  const SharedPrefencesUse({Key? key}) : super(key: key);

  @override
  State<SharedPrefencesUse> createState() => _SharedPrefencesUseState();
}

class _SharedPrefencesUseState extends State<SharedPrefencesUse> {
  int _currentValue = 0;
  bool _isLoading = false;
  late final SharedManager _sharedManager;

  @override
  void initState() {
    super.initState();
    _sharedManager = SharedManager();
    _initialize();
  }

  void _initialize() async {
    changeLoading();
    await _sharedManager.init();
    changeLoading();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    /* final prefs = await SharedPreferences.getInstance();
    final int? _counter = prefs.getInt('counter'); */
    _onChangeVAlue(_sharedManager.getString(SharedKeys.counter) ?? "");
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _onChangeVAlue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_floatingSave(), _floatingdelete()],
      ),
      appBar: AppBar(
        title: Text(
          _currentValue.toString(),
          style: const TextStyle(color: Colors.red),
        ),
        actions: [
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.red,
                ))
              : const SizedBox.shrink()
        ],
      ),
      body: Container(
        color: Colors.white54,
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) {
            _onChangeVAlue(value);
          },
        ),
      ),
    );
  }

  FloatingActionButton _floatingSave() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await _sharedManager.saveString(
            SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
      child: const Icon(Icons.save),
    );
  }

  FloatingActionButton _floatingdelete() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await _sharedManager.remove(SharedKeys.counter);
        changeLoading();
      },
      child: const Icon(Icons.track_changes),
    );
  }
}
