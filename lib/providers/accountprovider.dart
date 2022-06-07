import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import '../models/account.dart';
import '../models/userdetails.dart';

class AccountProvider extends ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;
  DatabaseReference accountRef =
      FirebaseDatabase.instance.ref().child('accounts');

  List<Account> allAccounts = [];

  void addAccount(Account account) {
    account.accountID = accountRef.child(user!.uid).push().key;
    allAccounts.add(account);
    accountRef.child("${user!.uid}/${account.accountID}").set(account.toMap());
  }

  Account getAccount(String id) {
    return allAccounts.firstWhere((element) => element.accountID == id);
  }

  List<Account> getAllAccounts() {
    return allAccounts;
  }

  void removeAccount(Account account) {
    allAccounts.remove(account);
    accountRef.child("${user!.uid}/${account.accountID}").remove();
  }

  Account updateAccount(Account account, index) {
    allAccounts[index] = account;
    accountRef.child("${user!.uid}/${account.accountID}").set(account.toMap());
    return allAccounts[index];
  }
}
