import 'package:flutter/material.dart';

import 'my_color.dart';

AppBarTheme myAppBarStyle() => const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      foregroundColor: Colors.white,
      backgroundColor: primaryClr,
      elevation: 0,
    );
AppBarTheme myAppBarStyleDark() => const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(color: white),
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );

InputDecorationTheme myInputDecorationStyle() {
  return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      fillColor: primaryClr);
}

FloatingActionButtonThemeData myFloatingActionButtonStyle() =>
    const FloatingActionButtonThemeData(backgroundColor: orangeClr);
IconThemeData myIconStyle() => const IconThemeData(color: Colors.white);
IconThemeData myIconStyleDark() => const IconThemeData(color: Colors.white70);

ElevatedButtonThemeData myElevatedButtonThemeStyle() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        backgroundColor: MaterialStateProperty.all<Color>(mycolAccent)),
  );
}

Widget verticalSpace(double h) => SizedBox(height: h);
