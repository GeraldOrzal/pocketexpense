import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import '../models/transaction.dart' as TransactionDetails;

class TransactionsProvider extends ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;

  DatabaseReference transactionRef =
      FirebaseDatabase.instance.ref().child('transactions');

  List<TransactionDetails.Transaction> allTransactions = [];
  double allExpense = 0.00;
  double allIncome = 0.00;

  void addTransaction(TransactionDetails.Transaction transaction) {
    transaction.transactionID = transactionRef.child(user!.uid).push().key!;
    transaction.transactionType == "Income"
        ? allIncome += transaction.amount
        : allExpense += transaction.amount;
    allTransactions.insert(0, transaction);
    transactionRef
        .child(
            "${user!.uid}/${transaction.accountID}/${transaction.transactionID}")
        .set(transaction.toMap());

    notifyListeners();
  }

  void setAllTransactions(
      List<TransactionDetails.Transaction> allTransactions) {
    this.allTransactions = allTransactions;
    calculateData();
  }

  void removeTransactionByAccount(String accountID) {
    allTransactions = allTransactions
        .where((element) => element.accountID != accountID)
        .toList();
    transactionRef.child("${user!.uid}/${accountID}").remove();
    calculateData();
    notifyListeners();
  }

  void calculateData() {
    allIncome = 0;
    allExpense = 0;

    allTransactions?.forEach((element) {
      print(element);
      if (element.transactionType == "Income") {
        allIncome += element.amount;
      } else {
        allExpense += element.amount;
      }
    });
  }

  void editTransaction(TransactionDetails.Transaction transaction) {
    allTransactions.forEach((element) {
      if (element == transaction) {
        element = transaction;
      }
    });
    transactionRef
        .child(
            "${user!.uid}/${transaction.accountID}/${transaction.transactionID}")
        .set(transaction.toMap());
    calculateData();
    notifyListeners();
  }

  void removeTransaction(TransactionDetails.Transaction transaction) {
    allTransactions.remove(transaction);
    transactionRef
        .child(
            "${user!.uid}/${transaction.accountID}/${transaction.transactionID}")
        .remove();
    calculateData();
    notifyListeners();
  }

  // List<Account> getAllAccounts() {
  //   return allTransactions;
  // }

  // void removeAccount(Account account) {
  //   allTransactions.remove(account);
  //   transactionRef.child("${user!.uid}/${account.accountID}").remove();
  // }

  // Account updateAccount(Account account, index) {
  //   allTransactions[index] = account;
  //   transactionRef.child("${user!.uid}/${account.accountID}").set(account.toMap());
  //   return allTransactions[index];
  // }

}
