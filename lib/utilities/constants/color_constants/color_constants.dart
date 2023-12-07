import 'package:flutter/material.dart';

class ColorConstants {
  static final ColorConstants _instance = ColorConstants._internal();

  factory ColorConstants() {
    return _instance;
  }

  ColorConstants._internal();

  Color darkGrey = const Color(0xFF303030);
  Color white = Colors.white;
}