import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/screens/entry_screen.dart';
import 'package:pocketexpense/screens/forgotpassword_screen.dart';
import 'package:pocketexpense/screens/home_screen.dart';
import 'package:pocketexpense/screens/login_screen.dart';
import 'package:pocketexpense/screens/register_screen.dart';
import 'package:pocketexpense/screens/start_screen.dart';
import 'package:pocketexpense/screens/createAcc_screen.dart';
import 'package:pocketexpense/screens/success_screen.dart';
import 'package:pocketexpense/screens/transaction_screen.dart';
import 'package:pocketexpense/screens/transactionlist_screen.dart';

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
    case transationRoute:
      return MaterialPageRoute(builder: (_) => TransactionListScreen());
    case crtAccountRoute:
      return MaterialPageRoute(builder: (_) => CreateAccScreen());
    case successRoute:
      return MaterialPageRoute(builder: (_) => SuccessScreen());
    case homeRoute:
      return MaterialPageRoute(builder: (_) => HomeScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
