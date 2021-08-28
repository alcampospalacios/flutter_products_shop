import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products_app/src/core/providers/product-form-provider.dart';
import 'package:products_app/src/core/providers/products-provider.dart';
import 'package:products_app/src/core/utils/acp-decorations.dart';
import 'package:products_app/src/models/products-model.dart';
import 'package:products_app/src/screens/product/product-form-widget.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ProductFormScreen extends StatelessWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    final _screenSize = MediaQuery.of(context).size;

    Product selectedPro = productProvider.selectedProduct;

    return ChangeNotifierProvider(
      create: (_) =>
          ProductFormProvider(productProvider.selectedProduct.copy()),
      child: _ProductFormScreenBody(
        screenSize: _screenSize,
        productProvider: productProvider,
      ),
    );
  }
}

class _ProductFormScreenBody extends StatelessWidget {
  const _ProductFormScreenBody({
    Key? key,
    required Size screenSize,
    required this.productProvider,
  })  : _screenSize = screenSize,
        super(key: key);

  final ProductsProvider productProvider;
  final Size _screenSize;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(children: [
          Stack(
            children: [
              ProductFormImageWidget(
                product: productProvider.selectedProduct,
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
                    onPressed: () async {
                      // TODO: to use image on camera button
                      final ImagePicker _picker = ImagePicker();
                      final XFile? photo =
                          await _picker.pickImage(source: ImageSource.camera);

                      if (photo == null) {
                        return;
                      }
                      productProvider.updateSelectedPicture(photo.path);
                    },
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
        child: productProvider.isSaving
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : Icon(Icons.save),
        onPressed: productProvider.isSaving
            ? null
            : () async {
                if (!productForm.isValidForm()) return;

                final String? pictureUrl = await productProvider.uploadImage();

                if (pictureUrl != null)
                  productForm.product.picture = pictureUrl;

                await productProvider.createOrEdit(productForm.product);
              },
      ),
    );
  }
}

class _ProductFormReactive extends StatelessWidget {
  const _ProductFormReactive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productFormProvider = Provider.of<ProductFormProvider>(context);
    final prodcutF = productFormProvider.product;
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
          key: productFormProvider.formKey,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: prodcutF.name,
                onChanged: (value) => prodcutF.name = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'Campo obligatorio';
                },
                decoration: ACPDecorations.acpInputDecorationMethod(
                    hintText: 'Nombre del producto', labelText: 'Nombre:'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: prodcutF.price.toString(),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value) {
                  if (double.tryParse(value) == null) {
                    prodcutF.price = 0;
                  } else {
                    prodcutF.price = double.parse(value);
                  }
                },
                validator: (value) {},
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
                  value: prodcutF.available,
                  onChanged: productFormProvider.updateAvaible),
              SizedBox(
                height: 30,
              ),
            ],
          )),
    );
  }
}
