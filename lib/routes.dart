import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/screens/entry_screen.dart';
import 'package:pocketexpense/screens/expense_screen.dart';
import 'package:pocketexpense/screens/forgotpassword_screen.dart';
import 'package:pocketexpense/screens/home_screen.dart';
import 'package:pocketexpense/screens/income_screen.dart';
import 'package:pocketexpense/screens/login_screen.dart';
import 'package:pocketexpense/screens/mainhome_screen.dart';
import 'package:pocketexpense/screens/register_screen.dart';
import 'package:pocketexpense/screens/start_screen.dart';
import 'package:pocketexpense/screens/createAcc_screen.dart';
import 'package:pocketexpense/screens/success_screen.dart';
import 'package:pocketexpense/screens/transaction_screen.dart';
import 'package:pocketexpense/screens/transactionlist_screen.dart';
import 'package:pocketexpense/screens/transfer_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case entryRoute:
      return MaterialPageRoute(builder: (_) => EntryScreen());
    case registerRoute:
      return MaterialPageRoute(builder: (_) => RegisterScreen());
    case forgotPasswordRoute:
      return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
    case loginRoute:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case startRoute:
      return MaterialPageRoute(builder: (_) => StartScreen());
    case crtAccountRoute:
      return MaterialPageRoute(builder: (_) => CreateAccScreen());
    case transactionRoute:
      return MaterialPageRoute(builder: (_) => TransactionScreen());
    case successRoute:
      return MaterialPageRoute(builder: (_) => SuccessScreen());
    case homeRoute:
      return MaterialPageRoute(builder: (_) => MainHomeScreen());
    case expenseRoute:
      return MaterialPageRoute(builder: (_) => ExpenseScreen());
    case incomeRoute:
      return MaterialPageRoute(builder: (_) => IncomeScreen());
    case transferRoute:
      return MaterialPageRoute(builder: (_) => TransferScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
