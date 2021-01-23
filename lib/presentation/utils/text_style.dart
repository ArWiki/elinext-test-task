import 'dart:ui';
import 'package:flutter/material.dart';

class AppFonts {
  AppFonts._();

  ///endregion

  ///region weight
  static const regular = FontWeight.w400;
  static const semi_bold = FontWeight.w600;
  static const bold = FontWeight.w500;

  ///endregion
}

class AppTextStyles {
  ///region font dimens
  static const font_size_60 = 60.0;
  static const font_size_34 = 34.0;
  static const font_size_32 = 32.0;
  static const font_size_30 = 30.0;
  static const font_size_28 = 28.0;
  static const font_size_26 = 26.0;
  static const font_size_24 = 24.0;
  static const font_size_22 = 22.0;
  static const font_size_20 = 20.0;
  static const font_size_18 = 18.0;
  static const font_size_17 = 17.0;
  static const font_size_16 = 16.0;
  static const font_size_15 = 15.0;
  static const font_size_14 = 14.0;
  static const font_size_13 = 13.0;
  static const font_size_12 = 12.0;
  static const font_size_11 = 11.0;
  static const font_size_10 = 10.0;
  static const font_size_9 = 9.0;
  static const font_size_8 = 8.0;
  static const font_size_7 = 7.0;

  ///endregion

  AppTextStyles._();

  ///region black

  static black14({
    FontWeight fontWeight = AppFonts.regular,
  }) =>
      TextStyle(
        color: Colors.black,
        fontSize: font_size_14,
        fontWeight: fontWeight,
      );

  static blue14({
    FontWeight fontWeight = AppFonts.regular,
    TextDecoration decoration = TextDecoration.none,
  }) =>
      TextStyle(
        color: Colors.blue,
        fontSize: font_size_14,
        fontWeight: fontWeight,
        decoration: decoration,
      );

  static grey34({
    FontWeight fontWeight = AppFonts.regular,
    TextDecoration decoration = TextDecoration.none,
  }) =>
      TextStyle(
        color: Colors.grey,
        fontSize: font_size_34,
        fontWeight: fontWeight,
        decoration: decoration,
      );

  ///endregion
}
