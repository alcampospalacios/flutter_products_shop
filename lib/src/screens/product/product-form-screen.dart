import 'package:flutter/material.dart';
import 'package:products_app/src/screens/product/product-form-widget.dart';

class ProductFormScreen extends StatelessWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [ProductFormImageWidget()],
            )
          ],
        ),
      ),
    );
  }
}
