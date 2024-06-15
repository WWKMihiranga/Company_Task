import 'package:flutter/material.dart';

class PastelColors {
  static const MaterialColor pastel = MaterialColor(
    _pastelPrimaryValue,  // Primary value for pastel color.
    <int, Color>{
      // Shades of pastel color
      50: Color(0xFFFFF0F5),
      100: Color(0xFFFFE0EB),
      200: Color(0xFFFFC1D6),
      300: Color(0xFFFFA2C2),
      400: Color(0xFFFF83AE),
      500: Color(_pastelPrimaryValue),
      600: Color(0xFFFF3385),
      700: Color(0xFFFF1A72),
      800: Color(0xFFFF005F),
      900: Color(0xFFFF0047),
    },
  );

  // Primary value for pastel color.
  static const int _pastelPrimaryValue = 0xFFFF66A3;
}
