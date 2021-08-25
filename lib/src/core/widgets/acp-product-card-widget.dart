import 'package:flutter/material.dart';
import 'package:products_app/src/models/products-model.dart';

class ACPProductCardWidget extends StatelessWidget {
  final Product product;

  const ACPProductCardWidget({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 10),
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
            ]),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            _BackgroundImage(
              product: product,
            ),
            _ProductOverviewDetails(
              product: product,
            ),
            _PriceTag(
              product: product,
            ),
            if (!product.available) _NotAvaible()
          ],
        ),
      ),
    );
  }
}

class _NotAvaible extends StatelessWidget {
  const _NotAvaible({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30), topLeft: Radius.circular(25)),
        child: Container(
          width: 100,
          height: 40,
          color: Colors.red[900],
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'No disponible',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final Product product;

  const _PriceTag({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), topRight: Radius.circular(25)),
        child: Container(
          width: 100,
          height: 40,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '\$${product.price}',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductOverviewDetails extends StatelessWidget {
  final Product product;

  const _ProductOverviewDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 90),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), topRight: Radius.circular(30)),
        child: Container(
          width: double.infinity,
          height: 70,
          color: Colors.indigo,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${product.name}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final Product product;
  const _BackgroundImage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: this.product.id,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: double.infinity,
          height: 400,
          child: this.product.picture != null
              ? FadeInImage(
                  placeholder: AssetImage('assets/no-image.png'),
                  image: NetworkImage('${product.picture}'),
                  fit: BoxFit.cover,
                )
              : Image(
                  image: AssetImage('assets/no-image.png'),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
