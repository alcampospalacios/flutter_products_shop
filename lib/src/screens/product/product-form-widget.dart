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
        child: this.product.picture != null
            ? FadeInImage(
                placeholder: AssetImage('assets/no-image.png'),
                image: NetworkImage('${product.picture}'),
                fit: BoxFit.cover,
              )
            : Image(
                image: AssetImage('assets/no-image.png'), fit: BoxFit.cover),
        width: double.infinity,
        height: _screenSize.height * 0.4,
        decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 5))
            ]),
      ),
    );
  }
}
