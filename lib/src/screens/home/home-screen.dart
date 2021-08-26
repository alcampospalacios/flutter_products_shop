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

    if (productsProvider.isLoading) return LoadingWidget();

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: productsProvider.products.length,
          itemBuilder: (BuildContext context, index) => GestureDetector(
              onTap: () {
                productsProvider.selectedProduct =
                    productsProvider.products[index];
                Navigator.pushNamed(context, 'product-form');
              },
              child: ACPProductCardWidget(
                product: productsProvider.products[index],
              ))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          productsProvider.selectedProduct =
              new Product(id: '', available: true, name: '', price: 0.0);

          Navigator.pushNamed(context, 'product-form');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
