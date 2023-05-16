
import 'package:flutter/material.dart';

class MWidgets {

  static Widget formTextFieldWidget(String labelText, String hintText, Color color,
      TextEditingController controller) {
    return TextField(
      decoration: InputDecoration(labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
        focusColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
                color: Colors.white, width: 2.0, style: BorderStyle.solid)),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
                color: Colors.white, width: 2.0, style: BorderStyle.solid)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
                color: Colors.white, width: 2.0, style: BorderStyle.solid)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
                color: Colors.white, width: 2.0, style: BorderStyle.solid)),
      ), style: TextStyle(color: color),
      keyboardType: TextInputType.name,
      controller: controller,);
  }

}