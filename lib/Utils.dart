import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapptwo/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension showSnackbar on BuildContext{

   showSnackbarr(String messgage) => ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(messgage)));
}

 addStringTo_ShrdPrfrnce(String key, String string) async{
   var sp = await SharedPreferences.getInstance();
   var isSaved = await sp.setString(key,string);
   return isSaved;
}

Future<String> getSharedPrefercneString(String key) async{
   var sp = await SharedPreferences.getInstance();
   return sp.getString(key) ?? "";
}

clearSharedPrfernce() async{
   var sp = await SharedPreferences.getInstance();
   sp.clear();
}

