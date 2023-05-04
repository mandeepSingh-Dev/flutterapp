import 'dart:ui';

import 'package:flutter/material.dart';

extension showSnackbar on BuildContext{

   showSnackbarr(String messgage) => ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(messgage)));
}