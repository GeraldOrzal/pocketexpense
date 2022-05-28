import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
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
                    style:
                        FontStyle.getHeader1(const Color.fromRGBO(0, 0, 0, 1)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputStyle.getInputDecoration1("Email"),
                    onChanged: (data) => _setCred(data),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                      onChanged: (data) => _setCred(data),
                      decoration: InputStyle.getInputDecoration1("Password")),
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: _onPressed,
                      style: CustomButtonStyle.getButtonStyle1,
                      child:
                          const Text("Login", style: FontStyle.getButtonText1),
                    ))
              ])),
            ),
            GestureDetector(
              onTap: () => {debugPrint("FORGOT")},
              child: Center(
                child: Text(
                  "Forgot Password?",
                  style:
                      FontStyle.getHeader1(const Color.fromRGBO(255, 0, 0, 1)),
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
                    style: FontStyle.getBodyText1(16, Colors.black),
                  ),
                  GestureDetector(
                    onTap: () =>
                        {Navigator.popAndPushNamed(context, REGISTER_ROUTE)},
                    child: Text(
                      "Sign up",
                      style: FontStyle.getTextLink1(16),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
