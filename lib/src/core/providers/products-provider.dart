import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:products_app/src/models/products-model.dart';
import 'package:http/http.dart' as http;

class ProductsProvider extends ChangeNotifier {
  final String _baseUrl =
      'flutter-projects-72232-default-rtdb.asia-southeast1.firebasedatabase.app';
  final List<Product> products = [];

  bool isLoading = true;
  bool isSaving = false;

  late Product selectedProduct;

  ProductsProvider() {
    this.loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final response = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(response.body);

    productsMap.forEach((key, value) {
      final tempProd = Product.fromMap(value);
      tempProd.id = key;
      this.products.add(tempProd);
    });

    this.isLoading = false;
    notifyListeners();

    return this.products;
  }

  Future createOrEdit(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
    } else {
      this.updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final resp = await http.put(url, body: product.toJson());

    final decodeData = resp.body;
    print(decodeData);
    return product.id;
  }
}
