import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:pocketexpense/helpers/textformatter.dart';
import '../models/account.dart';
import '../models/userdetails.dart';

enum TransactOperation { addition, subtraction }

class AccountProvider extends ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;

  DatabaseReference accountRef =
      FirebaseDatabase.instance.ref().child('accounts');

  List<Account> allAccounts = [];
  double totalAmount = 0.00;
  void addAccount(Account account) {
    account.accountID = accountRef.child(user!.uid).push().key;
    allAccounts.add(account);
    accountRef.child("${user!.uid}/${account.accountID}").set(account.toMap());
    totalAmount += double.parse(account.amount);
    notifyListeners();
  }

  double calculateWalletAmount() {
    double total = 0;
    allAccounts.forEach((element) {
      total += double.parse(element.amount);
    });
    return total;
  }

  void setAllAccount(List<Account> allAccounts) {
    this.allAccounts = allAccounts;
    totalAmount = calculateWalletAmount();
  }

  Account getAccount(String id) {
    return allAccounts.firstWhere((element) => element.accountID == id);
  }

  void makeChangesToWalletAmount(
      double number, String accountID, TransactOperation operation) {
    int index = 0;
    allAccounts.forEach((element) {
      if (element.accountID == accountID) {
        double newNumber = operation == TransactOperation.addition
            ? double.parse(element.amount) + number
            : double.parse(element.amount) - number;
        element.amount = newNumber.toString();
        updateAccount(element, index);
      }
      index++;
    });

    totalAmount = calculateWalletAmount();
    notifyListeners();
  }

  List<Account> getAllAccounts() {
    return allAccounts;
  }

  void removeAccount(Account account) {
    allAccounts.remove(account);
    accountRef.child("${user!.uid}/${account.accountID}").remove();
    totalAmount = calculateWalletAmount();
    notifyListeners();
  }

  Account updateAccount(Account account, index) {
    allAccounts[index] = account;
    accountRef.child("${user!.uid}/${account.accountID}").set(account.toMap());
    return allAccounts[index];
  }
}
