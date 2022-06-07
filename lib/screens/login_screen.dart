import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pocketexpense/screens/start_screen.dart';
import '../models/user.dart';
import '../styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginScreen());
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // void _setCred(String data) {}
  final _email = TextEditingController();
  final _password = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String errorMessage = '';
  void _onPressed() async {
    if (_formkey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _email.text, password: _password.text);
        Navigator.of(context).pushNamed(startRoute);
      } on FirebaseAuthException catch (error) {
        errorMessage = error.message!;
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _email,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: const InputDecoration(hintText: "Email"),
                        // onChanged: (data) => _setCred(data),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _password,
                        obscureText: true,
                        // onChanged: (data) => _setCred(data),
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: const InputDecoration(hintText: "Password"),
                      ),
                    ),
                    Center(
                      child: Text(errorMessage),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          onPressed: _onPressed,
                          child: Text("Login",
                              style: Theme.of(context).textTheme.button),
                        ))
                  ])),
            ),
            GestureDetector(
              onTap: () => {Navigator.pushNamed(context, forgotPasswordRoute)},
              child: Center(
                child: Text("Forgot Password?",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.red)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account yet? ",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  GestureDetector(
                    onTap: () =>
                        {Navigator.popAndPushNamed(context, registerRoute)},
                    child: Text(
                      "Sign up",
                      style: Theme.of(context).textTheme.headline3,
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
