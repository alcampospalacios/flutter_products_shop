import 'package:flutter/material.dart';

class CardContainerWidget extends StatelessWidget {
  final Widget child;
  const CardContainerWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 15, offset: Offset(0, 5)),
            ]),
        child: this.child,
      ),
    );
  }
}
