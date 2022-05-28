import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/screens/dashboard_screen.dart';
import 'package:pocketexpense/screens/entry_screen.dart';
import 'package:pocketexpense/screens/login_screen.dart';
import 'package:pocketexpense/screens/register_screen.dart';
import 'screens/setup_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ENTRY_ROUTE:
      return MaterialPageRoute(builder: (_) => EntryScreen());
    case LOGIN_ROUTE:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case REGISTER_ROUTE:
      return MaterialPageRoute(builder: (_) => RegisterScreen());
    case DASHBOARD_ROUTE:
      return MaterialPageRoute(builder: (_) => Dashboard());
    case SETUP_ROUTE:
      return MaterialPageRoute(builder: (_) => SetupScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
