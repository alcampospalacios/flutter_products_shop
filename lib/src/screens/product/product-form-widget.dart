import 'dart:io';

import 'package:flutter/material.dart';
import 'package:products_app/src/models/products-model.dart';

class ProductFormImageWidget extends StatelessWidget {
  final Product product;
  const ProductFormImageWidget({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Hero(
      tag: this.product.id,
      child: Container(
        child: Opacity(opacity: 0.9, child: getImage(this.product.picture)),
        width: double.infinity,
        height: _screenSize.height * 0.4,
        decoration: BoxDecoration(color: Colors.black, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5))
        ]),
      ),
    );
  }

  Widget getImage(String? picture) {
    if (picture == null) {
      return Image(image: AssetImage('assets/no-image.png'), fit: BoxFit.cover);
    }

    if (picture.startsWith('http')) {
      return FadeInImage(
        placeholder: AssetImage('assets/no-image.png'),
        image: NetworkImage('${product.picture}'),
        fit: BoxFit.cover,
      );
    }

    return Image.file(
      File(picture),
      fit: BoxFit.cover,
    );
  }
}
