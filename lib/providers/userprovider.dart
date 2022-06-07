import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import '../models/account.dart';
import '../models/userdetails.dart';

class UserProvider extends ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;
  DatabaseReference userDetailsRef =
      FirebaseDatabase.instance.ref().child('users');

  UserDetails? userDetails;

  void setMydata(UserDetails userDetails) {
    this.userDetails = userDetails;
  }

  void saveDetails(UserDetails userDetails) {
    userDetailsRef.child(user!.uid).set(userDetails.toJson());
    setMydata(userDetails);
  }

  void updateDetails(UserDetails userDetails) {
    userDetailsRef.child(user!.uid).set(userDetails.toMap());
    setMydata(userDetails);
  }
}
