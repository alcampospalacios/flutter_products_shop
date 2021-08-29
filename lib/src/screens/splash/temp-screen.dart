import 'package:flutter/material.dart';
import 'package:products_app/src/core/providers/auth-provider.dart';
import 'package:provider/provider.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    // TODO: THis is pending.

    return Scaffold(
      body: Container(
        child: Center(
            child: Column(children: [
          Image(image: AssetImage('assets/splash-screen.png')),
          FutureBuilder(
              future: authProvider.isAuthenticated(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (!snapshot.hasData) {
                  Future.microtask(() {
                    Navigator.of(context).pushReplacementNamed('login');
                  });
                } else {
                  Future.microtask(() {
                    Navigator.of(context).pushReplacementNamed('home');
                  });
                }

                return Container();
              }),
        ])),
      ),
    );
  }
}
