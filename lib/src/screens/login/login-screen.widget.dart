import 'dart:math';

import 'package:flutter/material.dart';

class LoginBackgroundWidget extends StatelessWidget {
  const LoginBackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [_PurpleBox()],
      ),
    );
  }
}

class _PurpleBox extends StatefulWidget {
  const _PurpleBox({Key? key}) : super(key: key);

  @override
  __PurpleBoxState createState() => __PurpleBoxState();
}

class __PurpleBoxState extends State<_PurpleBox> {
  double? _top;
  double? _left;
  double? _right;
  double? _bottom;

  bool canAnimate = true;

  @override
  void initState() {
    super.initState();
    this.executeInstruction().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final random = Random();

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ])),
      child: Stack(
        children: [
          AnimatedPositioned(
            child: _Bubble(),
            top: _top == null ? 90 : _top! * random.nextDouble(),
            left: _left == null ? 30 : _left! * random.nextDouble(),
            duration: Duration(seconds: 4),
            onEnd: () {
              this.randomPosition(1.5, 2, 1, 1);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            top: _top == null ? -40 : _top! * random.nextDouble(),
            left: _left == null ? -30 : _left! * random.nextDouble(),
            duration: Duration(seconds: 4),
            onEnd: () {
              this.randomPosition(-1, 0.8, 1, 1);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            top: _top == null ? -50 : _top! * random.nextDouble(),
            right: _right == null ? -20 : _right! * random.nextDouble(),
            duration: Duration(seconds: 4),
            onEnd: () {
              this.randomPosition(1.2, 1, -0.3, 1);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            bottom: _bottom == null ? -50 : _bottom! * random.nextDouble(),
            left: _left == null ? 10 : _left! * random.nextDouble(),
            duration: Duration(seconds: 4),
            onEnd: () {
              this.randomPosition(1, 0.3, 1, 1.8);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            bottom: _bottom == null ? 120 : _bottom! * random.nextDouble(),
            right: _right == null ? 30 : _right! * random.nextDouble(),
            duration: Duration(seconds: 4),
            onEnd: () {
              this.randomPosition(1, 1, 3, 2.5);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            top: _top == null ? 60 : _top! * random.nextDouble(),
            right: _right == null ? 25 : _right! * random.nextDouble(),
            duration: Duration(seconds: 4),
            onEnd: () {
              this.randomPosition(1.3, 1, 1.2, 1);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            bottom: _bottom == null ? 10 : _bottom! * random.nextDouble(),
            right: _right == null ? 80 : _right! * random.nextDouble(),
            duration: Duration(seconds: 4),
            onEnd: () {
              this.randomPosition(1, 1, 1.4, 1.5);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            top: _top == null ? 120 : _top! * random.nextDouble(),
            left: _left == null ? 30 : _left! * random.nextDouble(),
            duration: Duration(seconds: 4),
            onEnd: () {
              this.randomPosition(2, 2.3, 1, 1);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            bottom: _bottom == null ? 70 : _bottom! * random.nextDouble(),
            right: _right == null ? 50 : _right! * random.nextDouble(),
            duration: Duration(seconds: 4),
            onEnd: () {
              this.randomPosition(1, 1, 2, 2.5);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  randomPosition(double t, double l, double r, double b) {
    final random = Random();

    this._top = random.nextInt(400).toDouble() * t;
    this._left = random.nextInt(400).toDouble() * l;
    this._right = random.nextInt(400).toDouble() * r;
    this._bottom = random.nextInt(400).toDouble() * b;
  }

  Future executeInstruction() {
    return Future.delayed(
        Duration(milliseconds: 500), randomPosition(1, 1, 1, 1));
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
