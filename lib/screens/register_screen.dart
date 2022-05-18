import 'package:flutter/material.dart';
import '../styles.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void _setCred(String data) {}
  void _onPressed() {}

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.8;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return SafeArea(
      child: Scaffold(
          body: Column(
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
                  "Create Account",
                  style: AuthStyle.getHeader1(const Color.fromRGBO(0, 0, 0, 1)),
                ),
              ],
            ),
          ),
          Container(
            height: 400.0,
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
                child: TextFormField(
                    onChanged: (data) => _setCred(data),
                    decoration:
                        AuthStyle.getInputDecoration1("Confirm Password")),
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: false,
                    onChanged: (bool? value) {
                      setState(() {});
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                          text: 'By signing up, you agree to the ',
                          style: AuthStyle.getBodyText1(12, Colors.black),
                          children: [
                            TextSpan(
                                text: "Terms of Service and Privacy Policy",
                                style: AuthStyle.getTextLink1(12))
                          ]),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: _onPressed,
                    style: AuthStyle.getButtonStyle1,
                    child:
                        const Text("Register", style: AuthStyle.getButtonText1),
                  ))
            ])),
          ),
          RichText(
            text: TextSpan(
                text: 'Already have an account? ',
                style: AuthStyle.getBodyText1(16, Colors.black),
                children: [
                  TextSpan(text: "Login", style: AuthStyle.getTextLink1(16))
                ]),
          )
        ],
      )),
    );
  }
}
