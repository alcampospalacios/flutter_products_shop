import 'dart:math';

import 'package:flutter/material.dart';
import 'package:products_app/src/core/providers/login-form-provider.dart';
import 'package:products_app/src/core/utils/acp-decorations.dart';
import 'package:provider/provider.dart';

class LoginBackgroundWidget extends StatelessWidget {
  final Widget child;
  const LoginBackgroundWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [_PurpleBox(), _HeaderIcon(), this.child],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 60),
      child: Icon(
        Icons.person_pin,
        color: Colors.white,
        size: 100,
      ),
    ));
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
  final random = Random();

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
            duration: Duration(seconds: 6),
            onEnd: () {
              this.randomPosition(1.5, 2, 1, 1);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            top: _top == null ? -40 : _top! * random.nextDouble(),
            left: _left == null ? -30 : _left! * random.nextDouble(),
            duration: Duration(seconds: 6),
            onEnd: () {
              this.randomPosition(-1, 0.8, 1, 1);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            top: _top == null ? -50 : _top! * random.nextDouble(),
            right: _right == null ? -20 : _right! * random.nextDouble(),
            duration: Duration(seconds: 6),
            onEnd: () {
              this.randomPosition(1.2, 1, -0.3, 1);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            bottom: _bottom == null ? -50 : _bottom! * random.nextDouble(),
            left: _left == null ? 10 : _left! * random.nextDouble(),
            duration: Duration(seconds: 6),
            onEnd: () {
              this.randomPosition(1, 0.3, 1, 1.8);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            bottom: _bottom == null ? 120 : _bottom! * random.nextDouble(),
            right: _right == null ? 30 : _right! * random.nextDouble(),
            duration: Duration(seconds: 6),
            onEnd: () {
              this.randomPosition(1, 1, 3, 2.5);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            top: _top == null ? 60 : _top! * random.nextDouble(),
            right: _right == null ? 25 : _right! * random.nextDouble(),
            duration: Duration(seconds: 6),
            onEnd: () {
              this.randomPosition(1.3, 1, 1.2, 1);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            bottom: _bottom == null ? 10 : _bottom! * random.nextDouble(),
            right: _right == null ? 80 : _right! * random.nextDouble(),
            duration: Duration(seconds: 6),
            onEnd: () {
              this.randomPosition(1, 1, 1.4, 1.5);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            top: _top == null ? 120 : _top! * random.nextDouble(),
            left: _left == null ? 30 : _left! * random.nextDouble(),
            duration: Duration(seconds: 6),
            onEnd: () {
              this.randomPosition(2, 2.3, 1, 1);
              setState(() {});
            },
          ),
          AnimatedPositioned(
            child: _Bubble(),
            bottom: _bottom == null ? 70 : _bottom! * random.nextDouble(),
            right: _right == null ? 50 : _right! * random.nextDouble(),
            duration: Duration(seconds: 6),
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

    this._top = random.nextInt(300).toDouble() * t;
    this._left = random.nextInt(300).toDouble() * l;
    this._right = random.nextInt(300).toDouble() * r;
    this._bottom = random.nextInt(300).toDouble() * b;
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

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFOrmProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: ACPDecorations.acpInputDecorationMethod(
                    hintText: 'john.doe@gmail.com',
                    labelText: 'Correo electronico',
                    prefixIcon: Icons.alternate_email_sharp),
                onChanged: (value) => loginForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);

                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El correo no es válido';
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: ACPDecorations.acpInputDecorationMethod(
                    hintText: '******',
                    labelText: 'Contraseña ',
                    prefixIcon: Icons.lock_outline),
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  return (value != null && value.length >= 5)
                      ? null
                      : 'La conseña debe tener al menos 5 carácteres';
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.indigo,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    'Aceptar',
                    style: TextStyle(color: Colors.white),
                  )),
              onPressed: () {
                if (!loginForm.isValidForm()) return;

                Navigator.pushReplacementNamed(context, 'home');
              },
            )
          ],
        ),
      ),
    );
  }
}
