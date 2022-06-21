import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get appBarTextStyle {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 18,
      color: Get.isDarkMode ? Colors.grey[400] : Colors.white,
    ),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
    ),
  );
}

TextStyle get titleStyle {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}

TextStyle get subTitleStyle {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.grey[300] : Colors.grey[600],
    ),
  );
}
