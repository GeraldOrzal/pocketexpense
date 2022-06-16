import 'dart:convert';

class UserDetails {
  String fullname;
  bool isFirstTime;

  UserDetails({
    required this.fullname,
    required this.isFirstTime,
  });

  UserDetails copyWith({
    String? fullname,
    bool? isFirstTime,
  }) {
    return UserDetails(
      fullname: fullname ?? this.fullname,
      isFirstTime: isFirstTime ?? this.isFirstTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'isFirstTime': isFirstTime,
    };
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      fullname: map['fullname'] as String,
      isFirstTime: map['isFirstTime'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetails.fromJson(String source) =>
      UserDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserDetails(fullname: $fullname, isFirstTime: $isFirstTime)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDetails &&
        other.fullname == fullname &&
        other.isFirstTime == isFirstTime;
  }

  @override
  int get hashCode => fullname.hashCode ^ isFirstTime.hashCode;
}
