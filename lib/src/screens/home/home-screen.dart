import 'package:flutter/material.dart';
import 'package:products_app/src/core/providers/products-provider.dart';
import 'package:products_app/src/core/widgets/acp-product-card-widget.dart';
import 'package:products_app/src/models/products-model.dart';
import 'package:products_app/src/screens/home/home-widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final List<Product> products = productsProvider.products;

    if (productsProvider.isLoading) return LoadingWidget();

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, index) => GestureDetector(
              onTap: () {
                productsProvider.selectedProduct = products[index];
                Navigator.pushNamed(context, 'product-form');
              },
              child: ACPProductCardWidget(
                product: products[index],
              ))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
