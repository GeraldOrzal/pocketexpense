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
          Row(
            children: const [
              Text(
                "Welcome Back!",
                style: AuthText.getHeader1,
              ),
            ],
          ),
          Container(
            height: 300.0,
            child: Form(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1)),
                      hintText: "Email"),
                  onChanged: (data) => _setCred(data),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    onChanged: (data) => _setCred(data),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1)),
                        hintText: "Password")),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                    onPressed: _onPressed,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      shadowColor: Colors.transparent,
                      minimumSize: const Size.fromHeight(40),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              )
            ])),
          ),
          GestureDetector(
            onTap: () => {debugPrint("FORGOT")},
            child: const Center(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    color: Color.fromRGBO(255, 0, 0, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account yet? ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                GestureDetector(
                  onTap: () => {debugPrint("TAP SIGN")},
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 0, 0, 1),
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
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
