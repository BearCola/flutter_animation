import 'package:flutte_animation/anim/chain_animation.dart';
import 'package:flutte_animation/anim/counter_animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
//  AnimationController controller;
//  Animation<double> animation;

  AnimationController _animationController;
  Animation _colorTween;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1800));
    _colorTween = ColorTween(begin: Colors.red, end: Colors.green)
        .animate(_animationController);
    _animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      },
    );
    _animationController.forward();

//    controller = AnimationController(
//      duration: Duration(milliseconds: 1800),
//      vsync: this,
//    );
//    animation = CurvedAnimation(
//      parent: controller,
//      curve: Curves.easeIn,
//    );
//    animation.addStatusListener(
//      (status) {
//        if (status == AnimationStatus.completed) {
//          controller.reverse();
//        } else if (status == AnimationStatus.dismissed) {
//          controller.forward();
//        }
//      },
//    );
//    controller.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ChainAnimation(
        animation: _colorTween,
//        colorAnimation: _colorTween,
      ),
    );
//    return Scaffold(body: Center(child: CounterAnimator()));
  }
}
