import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle style({
    required BuildContext context,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    bool underline = false,
    Color? decorationColor,
    String fontFamily = 'Roboto',
    FontStyle fontStyle = FontStyle.normal,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;

    double scaledFontSize = fontSize;

    if (screenWidth < 360) {
      scaledFontSize = fontSize * 0.85;
    } else if (screenWidth < 480) {
      scaledFontSize = fontSize * 0.95;
    } else if (screenWidth > 600) {
      scaledFontSize = fontSize * 1.2;
    }

    return TextStyle(
      fontSize: scaledFontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      decorationColor: decorationColor ?? color,
      fontFamily: fontFamily,
      fontStyle: fontStyle,
    );
  }
}