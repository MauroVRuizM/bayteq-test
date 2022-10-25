import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:bayteq_test/app/core/utils/constants.dart';

class AppTextThemes {
  static TextStyle title = TextStyle(
      fontSize: 0.04 * Constants.size.height,
      fontWeight: FontWeight.w600);

  static TextStyle titleSecondary = TextStyle(
      fontSize: 0.036 * Constants.size.height,
      fontWeight: FontWeight.w500);

  static TextStyle textItem = TextStyle(
      fontSize: 0.024 * Constants.size.height);

  static TextStyle textButton = TextStyle(
      fontSize: 0.02 * Constants.size.height,
      fontWeight: FontWeight.w500,
      color: HexColor('f1faee'));

  static TextStyle subtitle = TextStyle(
    fontSize: 0.02 * Constants.size.height,
    fontWeight: FontWeight.w500,
  );

  static TextStyle description = TextStyle(
    fontSize: 0.02 * Constants.size.height,
    fontWeight: FontWeight.normal,
  );
}