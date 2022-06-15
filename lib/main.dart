import 'package:flutter/material.dart';
import 'package:pocketexpense/routes.dart';
import 'package:pocketexpense/screens/account_screen.dart';
import 'package:pocketexpense/screens/createacc_screen.dart';
import 'package:pocketexpense/screens/entry_screen.dart';
import 'package:pocketexpense/screens/expense_screen.dart';
import 'package:pocketexpense/screens/home_screen.dart';
import 'package:pocketexpense/screens/mainhome_screen.dart';
import 'package:pocketexpense/screens/start_screen.dart';
import 'package:pocketexpense/styles.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {}

        return MaterialApp(
            title: 'Material App',
            theme: defaultThemeData,
            onGenerateRoute: generateRoute,
            home: EntryScreen());
      },
    );
  }
}
