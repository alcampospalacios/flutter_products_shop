import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:products_app/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Products',
        theme: ThemeData.light(),
        initialRoute: 'login',
        routes: getApplicationRoutes());
  }
}
