import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  void _onPressed() {}
  @override
  Widget build(BuildContext context) {
    Future<void> showCustomDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Note', style: Theme.of(context).textTheme.headline2),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('The password request form will be sent to this email.',
                      style: Theme.of(context).textTheme.bodyText1),
                  Text('Are you sure you want to proceed?',
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Proceed',
                    style: Theme.of(context).textTheme.bodyText1),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }

    return SafeArea(
        child: Scaffold(
      body: Column(children: [
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
                "Forgot Password",
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(hintText: "Email"),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: showCustomDialog,
                    child: Text("Submit",
                        style: Theme.of(context).textTheme.button),
                  ))
            ],
          )),
        )
      ]),
    ));
  }
}
