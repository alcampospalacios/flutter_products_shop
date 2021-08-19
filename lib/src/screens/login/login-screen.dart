import 'package:flutter/material.dart';
import 'package:products_app/src/core/providers/login-form-provider.dart';
import 'package:products_app/src/core/widgets/acp-widgets.dart';
import 'package:products_app/src/screens/login/login-screen.widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoginBackgroundWidget(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
            ),
            CardContainerWidget(
                child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Iniciar sesión',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 30,
                ),
                ChangeNotifierProvider(
                  create: (_) => LoginFOrmProvider(),
                  child: LoginForm(),
                )
              ],
            )),
            SizedBox(
              height: 50,
            ),
            Text('Crear una nueva cuenta'),
          ],
        ),
      ),
    ));
  }
}
