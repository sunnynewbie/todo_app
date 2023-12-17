import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Color.fromARGB(255, 151, 0, 177);
  static const Color titleColor = Color(0xff121212);
  static const Color subTitleColor = Color.fromARGB(255, 196, 196, 196);

  static FlexSchemeColor schemeLight = FlexSchemeColor.from(
    primary: Color.fromARGB(255, 1, 66, 170),
    brightness: Brightness.light,

  );

}
