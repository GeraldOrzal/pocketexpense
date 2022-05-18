import 'package:flutter/material.dart';

const BORDER_RADIUS = 30.0;
const BUTTON_HEIGHT = 40.0;

abstract class AuthStyle {
  static TextStyle getHeader1(Color color) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: color,
        fontFamily: 'Inter');
  }

  static const TextStyle getButtonText1 = TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Inter');
  static TextStyle getBodyText1(double size, Color color) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: size,
        fontFamily: 'Inter');
  }

  static TextStyle getTextLink1(double size) {
    return TextStyle(
        color: Color.fromRGBO(255, 0, 0, 1),
        overflow: TextOverflow.clip,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.bold,
        fontSize: size);
  }

  static InputDecoration getInputDecoration1(String data) {
    return InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        hintText: data);
  }

  static ButtonStyle getButtonStyle1 = ElevatedButton.styleFrom(
    primary: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(BORDER_RADIUS),
    ),
    shadowColor: Colors.transparent,
    minimumSize: const Size.fromHeight(BUTTON_HEIGHT),
  );
}
