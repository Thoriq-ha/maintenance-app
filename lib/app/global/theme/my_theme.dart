import 'package:flutter/material.dart';

import 'my_color.dart';
import 'my_component_style.dart';

class Themes {
  static final light = ThemeData(
      scaffoldBackgroundColor: greyClr,
      backgroundColor: greyClr,
      primaryColor: primaryClr,
      brightness: Brightness.light,
      floatingActionButtonTheme: myFloatingActionButtonStyle(),
      appBarTheme: myAppBarStyle(),
      elevatedButtonTheme: myElevatedButtonThemeStyle(),
      inputDecorationTheme: myInputDecorationStyle(),
      iconTheme: myIconStyle(),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: mycolAccent));

  static final dark = ThemeData(
    backgroundColor: darkcolAccent,
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
    iconTheme: myIconStyleDark(),
    appBarTheme: myAppBarStyleDark(),
  );
}
