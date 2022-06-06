import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pocketexpense/models/account.dart';

class UserDetails {
  final String firstname;
  final bool isFirstTime;
  final String middlename;
  final List<Account> accounts;

  UserDetails({
    required this.firstname,
    required this.isFirstTime,
    required this.middlename,
    required this.accounts,
  });

  UserDetails copyWith({
    String? firstname,
    bool? isFirstTime,
    String? middlename,
    List<Account>? accounts,
  }) {
    return UserDetails(
      firstname: firstname ?? this.firstname,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      middlename: middlename ?? this.middlename,
      accounts: accounts ?? this.accounts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstname,
      'isFirstTime': isFirstTime,
      'middlename': middlename,
      'accounts': accounts,
    };
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      firstname: map['firstname'] as String,
      isFirstTime: map['isFirstTime'] as bool,
      middlename: map['middlename'] as String,
      accounts: List<Account>.from((map['accounts'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetails.fromJson(String source) =>
      UserDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Userdetails(firstname: $firstname, isFirstTime: $isFirstTime, middlename: $middlename, accounts: $accounts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDetails &&
        other.firstname == firstname &&
        other.isFirstTime == isFirstTime &&
        other.middlename == middlename &&
        listEquals(other.accounts, accounts);
  }

  @override
  int get hashCode {
    return firstname.hashCode ^
        isFirstTime.hashCode ^
        middlename.hashCode ^
        accounts.hashCode;
  }
}
