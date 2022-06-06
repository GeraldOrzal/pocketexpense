import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pocketexpense/models/transaction.dart';

class Account {
  final String accountype;
  final int amount;
  final String bankname;
  final int initialAmount;
  final List<Transaction> transactions;
  Account({
    required this.accountype,
    required this.amount,
    required this.bankname,
    required this.initialAmount,
    required this.transactions,
  });

  Account copyWith({
    String? accountype,
    int? amount,
    String? bankname,
    int? initialAmount,
    List<Transaction>? transactions,
  }) {
    return Account(
      accountype: accountype ?? this.accountype,
      amount: amount ?? this.amount,
      bankname: bankname ?? this.bankname,
      initialAmount: initialAmount ?? this.initialAmount,
      transactions: transactions ?? this.transactions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountype': accountype,
      'amount': amount,
      'bankname': bankname,
      'initialAmount': initialAmount,
      'transactions': transactions,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      accountype: map['accountype'] as String,
      amount: map['amount'].toInt() as int,
      bankname: map['bankname'] as String,
      initialAmount: map['initialAmount'].toInt() as int,
      transactions:
          List<Transaction>.from(map['transactions'] as List<dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Account(accountype: $accountype, amount: $amount, bankname: $bankname, initialAmount: $initialAmount, transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Account &&
        other.accountype == accountype &&
        other.amount == amount &&
        other.bankname == bankname &&
        other.initialAmount == initialAmount &&
        listEquals(other.transactions, transactions);
  }

  @override
  int get hashCode {
    return accountype.hashCode ^
        amount.hashCode ^
        bankname.hashCode ^
        initialAmount.hashCode ^
        transactions.hashCode;
  }
}
