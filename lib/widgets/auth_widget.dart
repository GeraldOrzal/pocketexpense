import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pocketexpense/screens/entry_screen.dart';
import 'package:pocketexpense/screens/loading_screen.dart';
import 'package:pocketexpense/screens/mainhome_screen.dart';
import 'package:pocketexpense/screens/start_screen.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final DatabaseReference userDetailsRef =
      FirebaseDatabase.instance.ref().child('users');

  Future<bool> checkIfFirstTime() async {
    var user = FirebaseAuth.instance.currentUser;
    DataSnapshot snapshot =
        await userDetailsRef.child("${user!.uid}/isFirstTime").get();

    return snapshot.value as bool;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return EntryScreen();
        }
        return FutureBuilder(
            future: checkIfFirstTime(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data as bool) {
                  return StartScreen();
                } else {
                  return MainHomeScreen();
                }
              }
              return LoadingScreen();
            });
      },
    );
  }
}
