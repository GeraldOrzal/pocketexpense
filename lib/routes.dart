import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/models/account.dart';
import 'package:pocketexpense/models/transaction.dart';
import 'package:pocketexpense/screens/account_screen.dart';
import 'package:pocketexpense/screens/accountdetails_screen.dart';
import 'package:pocketexpense/screens/accountedit_screen.dart';
import 'package:pocketexpense/screens/entry_screen.dart';
import 'package:pocketexpense/screens/expense_screen.dart';
import 'package:pocketexpense/screens/forgotpassword_screen.dart';
import 'package:pocketexpense/screens/home_screen.dart';
import 'package:pocketexpense/screens/income_screen.dart';
import 'package:pocketexpense/screens/login_screen.dart';
import 'package:pocketexpense/screens/mainhome_screen.dart';
import 'package:pocketexpense/screens/notification_screen.dart';
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
      Transaction transaction = settings.arguments as Transaction;
      return MaterialPageRoute(
          builder: (_) => TransactionScreen(
                selectedTransaction: transaction,
              ));
    case successRoute:
      return MaterialPageRoute(builder: (_) => SuccessScreen());
    case notificationRoute:
      return MaterialPageRoute(builder: (_) => NotificationScreen());
    case homeRoute:
      return MaterialPageRoute(builder: (_) => MainHomeScreen());
    case expenseRoute:
      var obj = settings.arguments as Map<String, String>;

      return MaterialPageRoute(
          builder: (_) =>
              ExpenseScreen(transactionType: obj["transactionType"] as String));
    case incomeRoute:
      return MaterialPageRoute(builder: (_) => IncomeScreen());
    case transferRoute:
      return MaterialPageRoute(builder: (_) => TransferScreen());
    case accountRoute:
      return MaterialPageRoute(builder: (_) => AccountScreen());
    case accountDetailsRoute:
      var obj = settings.arguments as Account;
      return MaterialPageRoute(
          builder: (_) => AccountDetails(
                account: obj,
              ));
    case accountEditRoute:
      var obj = settings.arguments as Account;

      return MaterialPageRoute(
          builder: (_) => AccountEditScreen(
                selectedAccount: obj,
              ));
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
