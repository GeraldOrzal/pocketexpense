import 'dart:convert';

class Account {
  String? accountID;
  final String accounttype;
  String amount;
  String? bankName;
  final String initialAmount;
  Account({
    this.accountID,
    required this.accounttype,
    required this.amount,
    this.bankName,
    required this.initialAmount,
  });

  Account copyWith({
    String? accountID,
    String? accounttype,
    String? amount,
    String? bankName,
    String? initialAmount,
  }) {
    return Account(
      accountID: accountID ?? this.accountID,
      accounttype: accounttype ?? this.accounttype,
      amount: amount ?? this.amount,
      bankName: bankName ?? this.bankName,
      initialAmount: initialAmount ?? this.initialAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountID': accountID,
      'accounttype': accounttype,
      'amount': amount,
      'bankName': bankName,
      'initialAmount': initialAmount,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      accountID: map['accountID'] == null ? null : map['accountID'] as String,
      accounttype: map['accounttype'] as String,
      amount: map['amount'] as String,
      bankName: map['bankName'] == null ? null : map['bankName'] as String,
      initialAmount: map['initialAmount'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Account(accountID: $accountID, accounttype: $accounttype, amount: $amount, bankName: $bankName, initialAmount: $initialAmount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Account &&
        other.accountID == accountID &&
        other.accounttype == accounttype &&
        other.amount == amount &&
        other.bankName == bankName &&
        other.initialAmount == initialAmount;
  }

  @override
  int get hashCode {
    return accountID.hashCode ^
        accounttype.hashCode ^
        amount.hashCode ^
        bankName.hashCode ^
        initialAmount.hashCode;
  }
}
