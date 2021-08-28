import 'dart:convert';
import 'dart:io';

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

  // To save image
  File? pictureFile;

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

    if (product.id == '') {
      await this.createProduct(product);
    } else {
      await this.updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.post(url, body: product.toJson());

    final decodeData = json.decode(resp.body);
    product.id = decodeData['name'];

    this.products.add(product);

    return product.id;
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    await http.put(url, body: product.toJson());

    final index =
        this.products.indexWhere((element) => element.id == product.id);
    this.products[index] = product;

    return product.id;
  }

  void updateSelectedPicture(String path) {
    this.selectedProduct.picture = path;

    this.pictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (this.pictureFile == null) return null;

    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dbcab4ll6/image/upload?upload_preset=zwrkselv');

    final uploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', this.pictureFile!.path);

    uploadRequest.files.add(file);

    final streamResponse = await uploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Error');
      return null;
    }

    this.pictureFile = null;
    final decodeData = json.decode(resp.body);
    return decodeData['secure_url'];
  }
}
