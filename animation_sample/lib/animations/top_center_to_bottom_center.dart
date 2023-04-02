import 'package:flutter/material.dart';

class TopCenterToBottomCenterScreen extends StatefulWidget {
  const TopCenterToBottomCenterScreen({super.key});

  @override
  State<TopCenterToBottomCenterScreen> createState() =>
      _TopCenterToBottomCenterScreenState();
}

class _TopCenterToBottomCenterScreenState
    extends State<TopCenterToBottomCenterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<Alignment> _tween;
  final Curve _curve = Curves.ease;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _tween = Tween(begin: Alignment.topCenter, end: Alignment.bottomCenter);
    _tween.chain(CurveTween(curve: _curve));
    _animation = _controller.drive(_tween);
  }

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return Align(
            alignment: _animation.value,
            child: const Text('hello'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.reset();
            _controller.forward();
          },
          child: const Icon(Icons.bolt)),
    );
  }
}
