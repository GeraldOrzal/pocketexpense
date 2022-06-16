import 'dart:convert';

class UserDetails {
  String firstname;
  bool isFirstTime;
  String middlename;
  UserDetails({
    required this.firstname,
    required this.isFirstTime,
    required this.middlename,
  });

  UserDetails copyWith({
    String? firstname,
    bool? isFirstTime,
    String? middlename,
  }) {
    return UserDetails(
      firstname: firstname ?? this.firstname,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      middlename: middlename ?? this.middlename,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstname,
      'isFirstTime': isFirstTime,
      'middlename': middlename,
    };
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      firstname: map['firstname'] as String,
      isFirstTime: map['isFirstTime'] as bool,
      middlename: map['middlename'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetails.fromJson(String source) =>
      UserDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserDetails(firstname: $firstname, isFirstTime: $isFirstTime, middlename: $middlename)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDetails &&
        other.firstname == firstname &&
        other.isFirstTime == isFirstTime &&
        other.middlename == middlename;
  }

  @override
  int get hashCode =>
      firstname.hashCode ^ isFirstTime.hashCode ^ middlename.hashCode;
}
