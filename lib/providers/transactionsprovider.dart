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
    transaction.isExpense
        ? allExpense += transaction.amount
        : allIncome += transaction.amount;
    allTransactions.insert(0, transaction);
    transactionRef
        .child("${user!.uid}/${transaction.transactionID}")
        .set(transaction.toMap());

    notifyListeners();
  }

  void setAllTransactions(
      List<TransactionDetails.Transaction> allTransactions) {
    this.allTransactions = allTransactions;
    calculateData();
  }

  void calculateData() {
    allTransactions.forEach((element) {
      if (element.isExpense) {
        allExpense += element.amount;
      } else {
        allIncome += element.amount;
      }
    });
  }
  // Account getAccount(String id) {
  //   return allTransactions.firstWhere((element) => element.accountID == id);
  // }

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
