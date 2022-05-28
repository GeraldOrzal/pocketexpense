import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';


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
  static const TextStyle getButtonText2 = TextStyle(
      color: Color.fromRGBO(255, 0, 0, 1),
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter');
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
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        hintText: data);
  }

  static ButtonStyle getButtonStyle1 = ElevatedButton.styleFrom(
    primary: Color.fromRGBO(220, 4, 25, 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(BORDER_RADIUS),
    ),
    shadowColor: Colors.transparent,
    minimumSize: const Size.fromHeight(BUTTON_HEIGHT),
  );

  static ButtonStyle getButtonStyle2 = ElevatedButton.styleFrom(
    primary: Color.fromRGBO(255, 204, 203, 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(BORDER_RADIUS),
    ),
    shadowColor: Colors.transparent,
    minimumSize: const Size.fromHeight(BUTTON_HEIGHT),
  );
}
