import 'package:flutter/material.dart';
import 'package:products_app/src/core/providers/login-form-provider.dart';
import 'package:products_app/src/core/widgets/acp-widgets.dart';
import 'package:products_app/src/screens/signup/signup-screen.widget.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SignupBackgroundWidget(
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
                  'Registrar usuario',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 30,
                ),
                ChangeNotifierProvider(
                  create: (_) => LoginFOrmProvider(),
                  child: SignupForm(),
                )
              ],
            )),
            SizedBox(
              height: 50,
            ),
            TextButton(
              child: Text(
                'Iniciar sesion',
                style: TextStyle(color: Colors.black54),
              ),
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
            ),
          ],
        ),
      ),
    ));
  }
}
