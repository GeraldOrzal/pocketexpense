import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:pocketexpense/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../models/account.dart';
import '../models/userdetails.dart';
import 'package:pocketexpense/screens/start_screen.dart';
import '../models/transaction.dart' as TransactionDetails;
import '../providers/accountprovider.dart';
import '../providers/transactionsprovider.dart';
import '../providers/userprovider.dart';
import '../styles.dart';

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
  final DatabaseReference userDetailsRef =
      FirebaseDatabase.instance.ref().child('users');
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final DatabaseReference userDetailsRef =
        FirebaseDatabase.instance.ref().child('users');
    DatabaseReference accountRef =
        FirebaseDatabase.instance.ref().child('accounts');
    DatabaseReference transactionRef =
        FirebaseDatabase.instance.ref().child('transactions');
    return AuthFlowBuilder<EmailFlowController>(
        listener: (oldstate, state, controller) async {
      if (state is SignedIn) {
        var user = FirebaseAuth.instance.currentUser;
        DataSnapshot snapshot =
            await userDetailsRef.child("${user!.uid}/isFirstTime").get();

        DataSnapshot data = await userDetailsRef.child(user!.uid).get();
        UserDetails userDetails = UserDetails.fromJson(jsonEncode(data.value));
        DataSnapshot allAccounts = await accountRef.child(user!.uid).get();
        DataSnapshot allTransactions =
            await transactionRef.child(user.uid).get();

        List<Account> tempAccounts = [];

        allAccounts?.children.forEach((element) {
          Account tempAccount = Account.fromJson(jsonEncode(element.value));
          tempAccount.accountID = element.key;
          tempAccounts.add(tempAccount);
        });
        List<TransactionDetails.Transaction> tempTransactions = [];
        if (allTransactions.children.length != 0) {
          allTransactions.children?.forEach((element) {
            TransactionDetails.Transaction tempTransaction =
                TransactionDetails.Transaction.fromJson(
                    jsonEncode(element.value));
            tempTransaction.transactionID = element.key;
            tempTransactions.add(tempTransaction);
          });
        }

        // print(tempTransactions);

        tempTransactions?.sort((a, b) => DateTime.parse(b.timestamp as String)!
            .compareTo(DateTime.parse(a.timestamp as String)));

        Provider.of<UserProvider>(context, listen: false)
            .setMydata(userDetails);
        Provider.of<AccountProvider>(context, listen: false)
            .setAllAccount(tempAccounts);
        Provider.of<TransactionsProvider>(context, listen: false)
            .setAllTransactions(tempTransactions);

        Navigator.of(context).pushNamedAndRemoveUntil(
            snapshot.value as bool ? startRoute : homeRoute,
            (Route<dynamic> route) => false);
      } else if (state is AuthFailed) {
        setState(() {
          errorMessage = state.exception.toString();
        });
      }
    }, builder: (context, state, controller, _) {
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

                          decoration:
                              const InputDecoration(hintText: "Password"),
                        ),
                      ),
                      Center(
                        child: Text(errorMessage),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                controller.setEmailAndPassword(
                                    _email.text, _password.text);
                              }
                            },
                            child: Text("Login",
                                style: Theme.of(context).textTheme.button),
                          ))
                    ])),
              ),
              GestureDetector(
                onTap: () =>
                    {Navigator.pushNamed(context, forgotPasswordRoute)},
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
    });
  }
}
