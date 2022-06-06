import 'dart:convert';

class Transaction {
  final int amount;
  final bool isExpense;
  final String timestamp;
  Transaction({
    required this.amount,
    required this.isExpense,
    required this.timestamp,
  });

  Transaction copyWith({
    int? amount,
    bool? isExpense,
    String? timestamp,
  }) {
    return Transaction(
      amount: amount ?? this.amount,
      isExpense: isExpense ?? this.isExpense,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'isExpense': isExpense,
      'timestamp': timestamp,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
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
