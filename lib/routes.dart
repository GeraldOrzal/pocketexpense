import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/screens/entry_screen.dart';
import 'package:pocketexpense/screens/home_screen.dart';
import 'package:pocketexpense/screens/login_screen.dart';
import 'package:pocketexpense/screens/register_screen.dart';
import 'package:pocketexpense/screens/start_screen.dart';
import 'package:pocketexpense/screens/createAcc_screen.dart';
import 'package:pocketexpense/screens/success_screen.dart';
import 'screens/setup_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case entryRoute:
      return MaterialPageRoute(builder: (_) => EntryScreen());
    case registerRoute:
      return MaterialPageRoute(builder: (_) => RegisterScreen());
    case loginRoute:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case startScreen:
      return MaterialPageRoute(builder: (_) => StartScreen());
    case crtAccountScreen:
      return MaterialPageRoute(builder: (_) => CreateAccScreen());
    case successScreen:
      return MaterialPageRoute(builder: (_) => SuccessScreen());
    case homeScreen:
      return MaterialPageRoute(builder: (_) => HomeScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
