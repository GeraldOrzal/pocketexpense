import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import '../models/userdetails.dart';

class UserProvider extends ChangeNotifier {
  DatabaseReference userDetailsRef =
      FirebaseDatabase.instance.ref().child('users');
  User? user = FirebaseAuth.instance.currentUser;

  UserDetails? userDetails;

  void setUserDetails(UserDetails userDetails) {
    this.userDetails = userDetails;
  }

  void saveDetails(UserDetails userDetails) {
    userDetailsRef.child(user!.uid).set(userDetails.toJson());
  }

  void updateDetails() {
    userDetailsRef.child("${user!.uid}/isFirstTime").set(false);
  }
}
