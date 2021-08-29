import 'package:flutter/material.dart';
import 'package:products_app/src/screens/home/home-screen.dart';
import 'package:products_app/src/screens/login/login-screen.dart';
import 'package:products_app/src/screens/product/product-form-screen.dart';
import 'package:products_app/src/screens/signup/signup-screen.dart';
import 'package:products_app/src/screens/splash/temp-screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'splash-screen': (_) => TempScreen(),
    'login': (_) => LoginScreen(),
    'signup': (_) => SignupScreen(),
    'home': (_) => HomeScreen(),
    'product-form': (_) => ProductFormScreen(),
  };
}
