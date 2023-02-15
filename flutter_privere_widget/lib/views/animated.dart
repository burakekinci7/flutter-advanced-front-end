import 'package:flutter/material.dart';

class AnimatedView extends StatefulWidget {
  const AnimatedView({Key? key}) : super(key: key);

  @override
  State<AnimatedView> createState() => _AnimatedViewState();
}

class _AnimatedViewState extends State<AnimatedView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: _DuractionItems.durationLow);
  }

  bool _isVisible = false;
  late AnimationController animationController;

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (() {
        animationController.animateTo(_isVisible ? 1 : 0);
        _changeVisible();
      })),
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: AnimatedCrossFade(
              firstChild: const Placeholder(),
              secondChild: const SizedBox.shrink(),
              crossFadeState: _isVisible
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: _DuractionItems.durationLow,
            ),
          ),
          AnimatedContainer(
            duration: _DuractionItems.durationLow,
            height: _isVisible ? 200 : 100,
            width: 200,
            color: Colors.red,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: animationController,
          )
        ],
      ),
    );
  }
}

class _DuractionItems {
  static const durationLow = Duration(seconds: 1);
}
