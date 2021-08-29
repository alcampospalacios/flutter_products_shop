import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:products_app/src/core/providers/auth-provider.dart';
import 'package:products_app/src/core/providers/products-provider.dart';
import 'package:products_app/src/core/utils/acp-notifications.dart';
import 'package:products_app/src/routes/routes.dart';
import 'package:provider/provider.dart';

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Products',
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.indigo,
            scaffoldBackgroundColor: Colors.grey[300],
            appBarTheme: AppBarTheme(color: Colors.indigo),
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: Colors.indigo)),
        initialRoute: 'login',
        scaffoldMessengerKey: ACPNotificationService.messengerKey,
        routes: getApplicationRoutes());
  }
}
