import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';
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
          body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
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
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Email"),
                    style: Theme.of(context).textTheme.bodyText1,
                    onChanged: (data) => _setCred(data),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                      onChanged: (data) => _setCred(data),
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(hintText: "Password")),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                      onChanged: (data) => _setCred(data),
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration:
                          InputDecoration(hintText: "Confirm Password")),
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
                            style: TxtStyle.getBodyText1(12, Colors.black),
                            children: [
                              TextSpan(
                                  text: "Terms of Service and Privacy Policy",
                                  style: Theme.of(context).textTheme.headline4,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext builder) {
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
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline2,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: RichText(
                                                            text: TextSpan(
                                                                text:
                                                                    "Minim reprehenderit sit eiusmod minim. Mollit commodo non velit aliquip et enim voluptate exercitation. Ut reprehenderit adipisicing cillum nulla anim. Fugiat eiusmod consectetur mollit aute nulla exercitation ea labore ut velit elit. Enim cillum dolor voluptate culpa cillum mollit aliqua. Occaecat aute nisi aute consectetur esse sint amet. Tempor eu nulla aliquip ea sunt cupidatat sunt aliquip anim excepteur et. Dolor pariatur nulla non nostrud laborum magna. Est exercitation veniam do anim id. Ipsum aute ad eiusmod enim mollit aute elit exercitation dolor nostrud. Pariatur eu amet quis incididunt pariatur ipsum adipisicing est magna. Velit cillum magna minim veniam amet laborum labore ullamco adipisicing proident. Quis eiusmod commodo anim ad exercitation fugiat eiusmod proident in amet sint ex. Do ullamco ad cillum fugiat. Ullamco veniam anim cupidatat qui sunt eu laborum occaecat dolor. Commodo sunt labore reprehenderit duis dolore esse reprehenderit cupidatat anim adipisicing laborum labore tempor.",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyText1),
                                                            textAlign: TextAlign
                                                                .justify),
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
                        onPressed: _onPressed,
                        child: Text("Register",
                            style: Theme.of(context).textTheme.button)))
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
                            Navigator.popAndPushNamed(context, loginRoute);
                          })
                  ]),
            )
          ],
        ),
      )),
    );
  }
}
