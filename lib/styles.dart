import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';

const BORDER_RADIUS = 17.0;
const BUTTON_HEIGHT = 48.0;

abstract class TxtStyle {
  static TextStyle getHeader1(Color color) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: color,
        fontFamily: 'Inter');
  }

  static TextStyle getWelcomeTxt(Color color) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 40.0,
        color: color,
        fontFamily: 'Inter');
  }

  static const TextStyle getButtonText1 = TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Inter');

  static const TextStyle getAmountTxt = TextStyle(
      color: Colors.white,
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter');

  static const TextStyle getSuceessTxt = TextStyle(
      color: Colors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter');

  //start screen button txt
  static const TextStyle getBtnNext = TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter');

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
        color: const Color.fromRGBO(255, 0, 0, 1),
        overflow: TextOverflow.clip,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.bold,
        fontSize: size);
  }
}

abstract class InputStyle {
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
}

abstract class LayoutStyle {
  static getUpperStyle(Color color) {
    return BoxDecoration(color: color);
  }
}

abstract class BtnStyle {
  static ButtonStyle getButtonStyle1 = ElevatedButton.styleFrom(
    primary: kPrimaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(BORDER_RADIUS),
    ),
    shadowColor: Colors.transparent,
    minimumSize: const Size.fromHeight(BUTTON_HEIGHT),
  ); //REGISTER BUTTON

  static ButtonStyle getButtonStyle2 = ElevatedButton.styleFrom(
    primary: const Color.fromRGBO(255, 204, 203, 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(BORDER_RADIUS),
    ),
    shadowColor: Colors.transparent,
    minimumSize: const Size.fromHeight(BUTTON_HEIGHT),
  ); //LOGIN BUTTON
}

//class style for borderbox
abstract class BoxStyle {
// borderbox or inputname
  static BoxDecoration getBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        offset: const Offset(0, 10),
        blurRadius: 5.0,
        color: Colors.black.withOpacity(0.23),
      ),
    ],
  );

// border box for banks
  static BoxDecoration getBankBox = const BoxDecoration(
    color: Color.fromRGBO(241, 241, 250, 1),
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );

  // border box for month
  static BoxDecoration getMonthBox = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(40)),
      boxShadow: [
        BoxShadow(
          blurRadius: 1.0,
        )
      ]);
}
