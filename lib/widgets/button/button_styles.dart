import 'package:flutter/material.dart';

class ButtonStyles {
  static final Map<String, ButtonStyle> variants = {
    'default': ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      overlayColor:
          MaterialStateProperty.all<Color>(Colors.blue.withOpacity(0.8)),
    ),
    'destructive': ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      overlayColor:
          MaterialStateProperty.all<Color>(Colors.red.withOpacity(0.8)),
    ),
    'outline': ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: Colors.black)),
      overlayColor:
          MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.2)),
    ),
    'secondary': ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      overlayColor:
          MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.8)),
    ),
    'ghost': ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      overlayColor:
          MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.2)),
    ),
    'link': ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      overlayColor:
          MaterialStateProperty.all<Color>(Colors.blue.withOpacity(0.2)),
    ),
  };

  static const Map<String, EdgeInsetsGeometry> sizes = {
    'default': EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    'sm': EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    'lg': EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    'icon': EdgeInsets.all(8),
  };
}
