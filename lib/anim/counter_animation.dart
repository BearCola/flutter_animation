import 'package:flutter/material.dart';

class CounterAnimator extends StatefulWidget {
  @override
  _CounterAnimatorState createState() => _CounterAnimatorState();
}

class _CounterAnimatorState extends State<CounterAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  Animation<Color> colorAnimation;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    animation = Tween(begin: 0.0, end: 10.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse(from: 5.0);
        } else if (status == AnimationStatus.reverse) {
          this.setState(() {
            this._counter = this._counter - 400;
          });
        }
      })
      ..addListener(() {
        this.setState(() {
          print('Animation Tween ${animation.value}');
        });
      });
    _controller.addListener(() {
      this.setState(() {
        _counter++;
        print(_counter);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        _controller.isAnimating ? (_counter).toStringAsFixed(2) : "Let's Begin",
        style: TextStyle(fontSize: 24.0 * animation.value + 16.0),
      ),
      onTap: () {
        _controller.forward(from: 0.0);
      },
    );
  }
}
