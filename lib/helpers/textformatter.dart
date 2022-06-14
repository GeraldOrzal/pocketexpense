import 'dart:ffi';

import 'package:flutter/services.dart';
import "package:intl/intl.dart";

class TextFormatter extends TextInputFormatter {
  static String formatNumber(String number) {
    return number.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      String tempText = newValue.text.substring(2, newValue.text.length);
      final int selectionIndexFromTheRight =
          tempText.length - newValue.selection.end;
      final f = NumberFormat("#,###.##", "tl");

      final number = newValue.text.replaceAll(f.symbols.GROUP_SEP, '');
      final tempString = number.replaceAll("₱", "");
      final newString = f.format(int.parse(tempString));
      return TextEditingValue(
        text: "₱ $newString",
        selection: TextSelection.collapsed(
            offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}
