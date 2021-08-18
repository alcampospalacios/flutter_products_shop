import 'package:flutter/material.dart';
import 'package:products_app/src/screens/login/login-screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (_) => LoginScreen(),
  };
}
