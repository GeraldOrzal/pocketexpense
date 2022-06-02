import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import '../models/userdetails.dart';

class UserProvider extends ChangeNotifier {
  var currentUser = FirebaseAuth.instance.currentUser;

  UserDetails? userDetails;

  void setUserDetails(UserDetails userDetails) {
    this.userDetails = userDetails;
  }
}
