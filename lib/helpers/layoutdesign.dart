import 'dart:ui';

import '../constant.dart';

class LayoutDesign {
  static Color? returnTransactionColor(String transactionType) {
    switch (transactionType) {
      case "Expense":
        return primary;
      case "Income":
        return income;
      case "Transfer":
        return transfer;
      default:
        return null;
    }
  }
}
