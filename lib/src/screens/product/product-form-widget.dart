import 'package:flutter/material.dart';

class ProductFormImageWidget extends StatelessWidget {
  const ProductFormImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      child: FadeInImage(
        placeholder: AssetImage('assets/no-image.png'),
        image: NetworkImage(
            'https://cdna.artstation.com/p/assets/images/images/002/074/730/medium/abbey-tex-johnson-abbeytexjohnson-kvothe.jpg?1456885828'),
        fit: BoxFit.cover,
      ),
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
    );
  }
}
