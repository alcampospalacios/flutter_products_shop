import 'package:flutter/material.dart';
import 'package:products_app/src/screens/home/home-screen.dart';
import 'package:products_app/src/screens/login/login-screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (_) => HomeScreen(),
    'login': (_) => LoginScreen(),
  };
}
