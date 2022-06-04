import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/models/userdetails.dart';
import 'package:pocketexpense/providers/userprovider.dart';

import 'package:pocketexpense/widgets/checkbox.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../styles.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // void _setCred(String data) {
  //   final _email;
  // }

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

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

    return AuthFlowBuilder<EmailFlowController>(
      listener: (oldState, newState, controller) => {
        if (newState is SigningUp) {print("SIGNING UP")}
      },
      builder: (context, state, controller, _) {
        return SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(15.0, 20.0, 40.0, 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            scale: 1.3,
                          ),
                          Text(
                            "Create Account",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                          key: _formkey,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                controller: _email,
                                keyboardType: TextInputType.emailAddress,
                                decoration:
                                    const InputDecoration(hintText: "Email"),
                                style: Theme.of(context).textTheme.bodyText1,
                                // onChanged: (data) => _setCred(data),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Email";
                                  }
                                  if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return "Please Enter Valid Email";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Center(
                              child: Text(errorMessage),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                // onChanged: (data) => _setCred(data),
                                controller: _password,
                                obscureText: true,
                                style: Theme.of(context).textTheme.bodyText1,
                                decoration:
                                    const InputDecoration(hintText: "Password"),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Password";
                                  }
                                  String pattern =
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                                  if (!RegExp(pattern).hasMatch(value)) {
                                    return "Password must be atleast 8 characters, include an uppercase letter, number and symbol.";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                // onChanged: (data) => _setCred(data),
                                controller: _confirmpassword,
                                obscureText: true,
                                style: Theme.of(context).textTheme.bodyText1,
                                decoration: const InputDecoration(
                                    hintText: "Confirm Password"),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Re-Enter Password";
                                  }
                                  if (_password.text != _confirmpassword.text) {
                                    return "Password do not match";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Row(
                              children: [
                                // Checkbox(
                                //   checkColor: Colors.white,
                                //   fillColor: MaterialStateProperty.resolveWith(
                                //       getColor),
                                //   value: false,
                                //   onChanged: (bool? value) {
                                //     setState(() {});
                                //   },
                                // ),
                                CheckboxFormField(),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                        text:
                                            'By signing up, you agree to the ',
                                        style: TxtStyle.getBodyText1(
                                            12, Colors.black),
                                        children: [
                                          TextSpan(
                                              text:
                                                  "Terms of Service and Privacy Policy",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  showModalBottomSheet<void>(
                                                      context: context,
                                                      builder: (BuildContext
                                                          builder) {
                                                        return DraggableScrollableSheet(
                                                            snap: true,
                                                            initialChildSize: 1,
                                                            builder: (context,
                                                                scrollController) {
                                                              return SingleChildScrollView(
                                                                  child: Column(
                                                                children: [
                                                                  Text(
                                                                    "Terms and Condition",
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .headline2,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: RichText(
                                                                        text: TextSpan(
                                                                            text:
                                                                                "Minim reprehenderit sit eiusmod minim. Mollit commodo non velit aliquip et enim voluptate exercitation. Ut reprehenderit adipisicing cillum nulla anim. Fugiat eiusmod consectetur mollit aute nulla exercitation ea labore ut velit elit. Enim cillum dolor voluptate culpa cillum mollit aliqua. Occaecat aute nisi aute consectetur esse sint amet. Tempor eu nulla aliquip ea sunt cupidatat sunt aliquip anim excepteur et. Dolor pariatur nulla non nostrud laborum magna. Est exercitation veniam do anim id. Ipsum aute ad eiusmod enim mollit aute elit exercitation dolor nostrud. Pariatur eu amet quis incididunt pariatur ipsum adipisicing est magna. Velit cillum magna minim veniam amet laborum labore ullamco adipisicing proident. Quis eiusmod commodo anim ad exercitation fugiat eiusmod proident in amet sint ex. Do ullamco ad cillum fugiat. Ullamco veniam anim cupidatat qui sunt eu laborum occaecat dolor. Commodo sunt labore reprehenderit duis dolore esse reprehenderit cupidatat anim adipisicing laborum labore tempor.",
                                                                            style: Theme.of(context)
                                                                                .textTheme
                                                                                .bodyText1),
                                                                        textAlign:
                                                                            TextAlign.justify),
                                                                  )
                                                                ],
                                                              ));
                                                            });
                                                      });
                                                })
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formkey.currentState!.validate()) {
                                        try {
                                          await auth
                                              .createUserWithEmailAndPassword(
                                                  email: _email.text,
                                                  password: _password.text);

                                          Provider.of<UserProvider>(context,
                                                  listen: false)
                                              .saveDetails(UserDetails(
                                                  firstname: "",
                                                  middlename: ""));
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  startRoute,
                                                  (Route<dynamic> route) =>
                                                      false);
                                        } on FirebaseAuthException catch (error) {
                                          errorMessage = error.message!;
                                        }
                                      }
                                    },
                                    child: Text("Register",
                                        style: Theme.of(context)
                                            .textTheme
                                            .button)))
                          ])),
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context).textTheme.bodyText1,
                          children: [
                            TextSpan(
                                text: "Login",
                                style: Theme.of(context).textTheme.headline3,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.popAndPushNamed(
                                        context, loginRoute);
                                  })
                          ]),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
