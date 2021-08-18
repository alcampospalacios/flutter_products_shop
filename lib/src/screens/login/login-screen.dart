import 'package:flutter/material.dart';
import 'package:products_app/src/screens/login/login-screen.widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginBackgroundWidget());
  }
}
