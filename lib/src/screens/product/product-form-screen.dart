import 'package:flutter/material.dart';
import 'package:products_app/src/screens/product/product-form-widget.dart';

class ProductFormScreen extends StatelessWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              ProductFormImageWidget(),
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
                  top: 300,
                  left: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    child: Container(
                      color: Colors.white,
                      width: _screenSize.width,
                      height: 200,
                    ),
                  ))
            ],
          ),
          _ProductFormReactive()
        ]),
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
      color: Colors.white,
      width: _screenSize.width,
      height: 400,
    );
  }
}
