import 'package:flutter/material.dart';

const BORDER_RADIUS = 30.0;
const BUTTON_HEIGHT = 40.0;

abstract class AuthStyle {
  static TextStyle getHeader1(Color color) {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: color);
  }

  static const TextStyle getButtonText1 =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  static const TextStyle getBodyText1 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0);
  static const TextStyle getTextLink1 = TextStyle(
      color: Color.fromRGBO(255, 0, 0, 1),
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold,
      fontSize: 16.0);
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
