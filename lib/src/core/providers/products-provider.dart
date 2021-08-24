import 'package:flutter/material.dart';
import 'package:products_app/src/models/products-model.dart';

class ProductsProvider extends ChangeNotifier {
  final String _baseUrl =
      'flutter-projects-72232-default-rtdb.asia-southeast1.firebasedatabase.app';
  final List<Product> products = [];
}
