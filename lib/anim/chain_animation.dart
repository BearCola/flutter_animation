import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ChainAnimation extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0.0, end: 175.0);
  static final _colorTween = Tween<Color>(begin: Colors.red, end: Colors.green);

//  Animation colorAnimation;

  ChainAnimation({Key key, Animation animation})
      : super(key: key, listenable: animation);
//    this.colorAnimation = colorAnimation;

  @override
  Widget build(BuildContext context) {
    final Animation animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
//          height: _sizeTween.evaluate(animation),
//          width: _sizeTween.evaluate(animation),
        child: FlatButton(
          onPressed: () {
            print('Hello there!');
          },
          color: animation.value,
          child: Text('Button'),
        ),
      ),
    );
  }
}
