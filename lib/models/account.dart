import 'dart:convert';

class Account {
  String? accountID;
  final String accountype;
  dynamic amount;
  String? bankname;
  final dynamic initialAmount;
  Account({
    required this.accountype,
    required this.amount,
    this.bankname,
    this.accountID,
    required this.initialAmount,
  });

  Account copyWith({
    String? accountype,
    int? amount,
    String? bankname,
    int? initialAmount,
  }) {
    return Account(
      accountype: accountype ?? this.accountype,
      amount: amount ?? this.amount,
      bankname: bankname ?? this.bankname,
      initialAmount: initialAmount ?? this.initialAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountype': accountype,
      'amount': amount,
      'bankname': bankname,
      'initialAmount': initialAmount,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      accountype: map['accountype'] as String,
      amount: map['amount'].toInt() as int,
      bankname: map['bankname'] as String,
      initialAmount: map['initialAmount'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Account(accountype: $accountype, amount: $amount, bankname: $bankname, initialAmount: $initialAmount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Account &&
        other.accountype == accountype &&
        other.amount == amount &&
        other.bankname == bankname &&
        other.initialAmount == initialAmount;
  }

  @override
  int get hashCode {
    return accountype.hashCode ^
        amount.hashCode ^
        bankname.hashCode ^
        initialAmount.hashCode;
  }
}
