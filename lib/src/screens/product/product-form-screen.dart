import 'package:flutter/material.dart';
import 'package:products_app/src/core/providers/products-provider.dart';
import 'package:products_app/src/core/utils/acp-decorations.dart';
import 'package:products_app/src/models/products-model.dart';
import 'package:products_app/src/screens/product/product-form-widget.dart';
import 'package:provider/provider.dart';

class ProductFormScreen extends StatelessWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    final _screenSize = MediaQuery.of(context).size;

    Product selectedPro = productProvider.selectedProduct;
    print('selectedPro: ${selectedPro.picture}');

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              ProductFormImageWidget(
                product: selectedPro,
              ),
              Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  )),
              Positioned(
                  top: 50,
                  right: 20,
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  )),
              Positioned(
                  top: 320,
                  left: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    child: Container(
                      color: Colors.white,
                      width: _screenSize.width,
                      height: 100,
                    ),
                  ))
            ],
          ),
          _ProductFormReactive(),
          SizedBox(
            height: 100,
          )
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_alt_outlined),
        onPressed: () {},
      ),
    );
  }
}

class _ProductFormReactive extends StatelessWidget {
  const _ProductFormReactive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      width: _screenSize.width,
      padding: EdgeInsets.symmetric(horizontal: 80),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      ),
      child: Form(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: ACPDecorations.acpInputDecorationMethod(
                hintText: 'Nombre del producto', labelText: 'Nombre:'),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: ACPDecorations.acpInputDecorationMethod(
                hintText: '\$0.0', labelText: 'Precio:'),
          ),
          SizedBox(
            height: 30,
          ),
          SwitchListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text('Disponible'),
              activeColor: Theme.of(context).accentColor,
              value: true,
              onChanged: (value) {}),
          SizedBox(
            height: 30,
          ),
        ],
      )),
    );
  }
}
