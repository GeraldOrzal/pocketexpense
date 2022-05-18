import 'package:flutter/material.dart';

import '../models/user.dart';
import '../styles.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  User? userCred;
  void _setCred(String data) {}
  void _onPressed() {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 20.0, 40.0, 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  scale: 1.3,
                ),
                Text(
                  "Welcome Back!",
                  style: AuthStyle.getHeader1(const Color.fromRGBO(0, 0, 0, 1)),
                ),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            child: Form(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: AuthStyle.getInputDecoration1("Email"),
                  onChanged: (data) => _setCred(data),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    onChanged: (data) => _setCred(data),
                    decoration: AuthStyle.getInputDecoration1("Password")),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: _onPressed,
                    style: AuthStyle.getButtonStyle1,
                    child: const Text("Login", style: AuthStyle.getButtonText1),
                  ))
            ])),
          ),
          GestureDetector(
            onTap: () => {debugPrint("FORGOT")},
            child: Center(
              child: Text(
                "Forgot Password?",
                style: AuthStyle.getHeader1(const Color.fromRGBO(255, 0, 0, 1)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account yet? ",
                  style: AuthStyle.getBodyText1(16, Colors.black),
                ),
                GestureDetector(
                  onTap: () => {debugPrint("TAP SIGN")},
                  child: Text(
                    "Sign up",
                    style: AuthStyle.getTextLink1(16),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
