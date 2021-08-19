import 'package:flutter/material.dart';

class ACPDecorations {
  static InputDecoration acpInputDecorationMethod(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.indigo),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo, width: 2)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.indigo,
              )
            : null);
  }
}
