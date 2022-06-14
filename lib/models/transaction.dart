import 'dart:convert';

class Transaction {
  int amount;
  final bool isExpense;
  String? transactionID;
  String? accountID;
  String? timestamp;
  String description;
  String? category;
  Transaction({
    this.transactionID,
    required this.category,
    required this.accountID,
    required this.amount,
    required this.description,
    required this.isExpense,
    this.timestamp,
  });

  Transaction copyWith({
    String? transactionID,
    String? category,
    int? amount,
    String? accountID,
    bool? isExpense,
    String? description,
    String? timestamp,
  }) {
    return Transaction(
      transactionID: transactionID ?? this.transactionID,
      category: category ?? this.category,
      description: description ?? this.description,
      accountID: accountID ?? this.accountID,
      amount: amount ?? this.amount,
      isExpense: isExpense ?? this.isExpense,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'accountID': accountID,
      'category': category,
      'amount': amount,
      'isExpense': isExpense,
      'timestamp': timestamp,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      category: map['category'] as String,
      accountID: map['accountID'] as String,
      description: map['description'] as String,
      amount: map['amount'].toInt() as int,
      isExpense: map['isExpense'] as bool,
      timestamp: map['timestamp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Transaction(amount: $amount, isExpense: $isExpense, timestamp: $timestamp)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transaction &&
        other.amount == amount &&
        other.isExpense == isExpense &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode => amount.hashCode ^ isExpense.hashCode ^ timestamp.hashCode;
}
