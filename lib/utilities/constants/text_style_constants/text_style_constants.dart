import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmbd/utilities/constants/color_constants/color_constants.dart';

class TextStyleConstants {
  static final TextStyleConstants _instance = TextStyleConstants._internal();

  factory TextStyleConstants() {
    return _instance;
  }

  TextStyleConstants._internal();

  TextStyle w800s20White = TextStyle(
    fontSize: 20.spMax,
    fontWeight: FontWeight.w800,
    color: ColorConstants().white,
  );

  TextStyle w600s18White = TextStyle(
    fontSize: 18.spMax,
    fontWeight: FontWeight.w600,
    color: ColorConstants().white,
  );

  TextStyle w500s14White = TextStyle(
    fontSize: 14.spMax,
    fontWeight: FontWeight.w500,
    color: ColorConstants().white,
  );

  TextStyle w400s12White = TextStyle(
    fontSize: 12.spMax,
    fontWeight: FontWeight.w400,
    color: ColorConstants().white,
  );
}
