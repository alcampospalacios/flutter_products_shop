import 'package:flutter/material.dart';

class ACPProductCardWidget extends StatelessWidget {
  const ACPProductCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
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
          children: [_BackgroundImage(), _ProductOverviewDetails()],
        ),
      ),
    );
  }
}

class _ProductOverviewDetails extends StatelessWidget {
  const _ProductOverviewDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      color: Colors.indigo,
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
          placeholder: AssetImage('assets/no-image.png'),
          image: NetworkImage(
              'https://cdna.artstation.com/p/assets/images/images/002/074/730/medium/abbey-tex-johnson-abbeytexjohnson-kvothe.jpg?1456885828'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
