import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pocketexpense/models/userdetails.dart';
import 'package:pocketexpense/providers/transactionsprovider.dart';
import 'package:pocketexpense/providers/userprovider.dart';
import 'package:pocketexpense/screens/entry_screen.dart';
import 'package:pocketexpense/screens/loading_screen.dart';
import 'package:pocketexpense/screens/mainhome_screen.dart';
import 'package:pocketexpense/screens/start_screen.dart';
import 'package:provider/provider.dart';

import '../models/account.dart';
import '../models/transaction.dart' as TransactionDetails;
import '../providers/accountprovider.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final DatabaseReference userDetailsRef =
      FirebaseDatabase.instance.ref().child('users');
  DatabaseReference accountRef =
      FirebaseDatabase.instance.ref().child('accounts');
  DatabaseReference transactionRef =
      FirebaseDatabase.instance.ref().child('transactions');
  Future<bool> setup() async {
    var user = FirebaseAuth.instance.currentUser;

    DataSnapshot data = await userDetailsRef.child(user!.uid).get();
    UserDetails userDetails = UserDetails.fromJson(jsonEncode(data.value));
    DataSnapshot allAccounts = await accountRef.child(user!.uid).get();
    DataSnapshot allTransactions = await transactionRef.child(user.uid).get();

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
            TransactionDetails.Transaction.fromJson(jsonEncode(element.value));
        tempTransaction.transactionID = element.key;
        tempTransactions.add(tempTransaction);
      });
    }

    // print(tempTransactions);

    tempTransactions?.sort((a, b) => DateTime.parse(b.timestamp as String)!
        .compareTo(DateTime.parse(a.timestamp as String)));

    Provider.of<UserProvider>(context, listen: false).setMydata(userDetails);
    Provider.of<AccountProvider>(context, listen: false)
        .setAllAccount(tempAccounts);
    Provider.of<TransactionsProvider>(context, listen: false)
        .setAllTransactions(tempTransactions);

    return userDetails.isFirstTime;
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
            future: setup(),
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
