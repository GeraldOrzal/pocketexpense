import 'package:firebase_database/firebase_database.dart';

class UserDetails {
  String? firstname;
  String? middlename;
  String? lastname;
  bool isFirstTime = true;

  UserDetails({this.firstname, this.middlename});

  // String get userid => useruid;

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'middlename': middlename,
        'isFirstTime': isFirstTime
      };

  // UserDetails.fromJson(Map json) {
  //   this.firstname = json['firstname'];
  //   this.middlename = json['middlename'];
  //   this.lastname = json['lastname'];
  //   this.isFirstTime = json['isFirstTime'];
  // }
  // static UserDetails fromJson(Map<String, dynamic> json) => UserDetails(
  //     firstname: json['idUser'],
  //     middlename: json['message'],
  //     useruid: json['lastname']);
}
