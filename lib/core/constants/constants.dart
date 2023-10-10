import 'package:flutter/material.dart';

class Constants {
  static const String addProduct = 'Add Product';
  static const Color primaryColor = Colors.black87;
  static ButtonStyle customButtonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    backgroundColor: Colors.black87,
    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
  );
}

class InsetsConstants {
  static const double betweenBlock = 34.0;
  static const double large = 30.0;
  static const double middle = 15.0;
  static const double small = 10;
  static const double minimum = 4.0;
}
