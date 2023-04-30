import 'dart:ui';

import 'package:flutter/material.dart';

class MColors{

    MColors._();

  static const _yellowPrimaryValue = 0xFF020202;

  static const MaterialColor black = MaterialColor(
    _yellowPrimaryValue,
    <int, Color>{
      50: Color(0xFF020202),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(_yellowPrimaryValue),
      600: Color(0xFF00EBFF),
      700: Color(0xFFFBC02D),
      800: Color(0xFFF9A825),
      900: Color(0xFFF57F17),
    },
  );


}