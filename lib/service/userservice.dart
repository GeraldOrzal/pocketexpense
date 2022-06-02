import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/userdetails.dart';

class UserService {
  DatabaseReference userDetailsRef =
      FirebaseDatabase.instance.ref().child('users');
  User? user = FirebaseAuth.instance.currentUser;

  void saveDetails(UserDetails userDetails) {
    userDetailsRef.child(user!.uid).set(userDetails.toJson());
  }

  void updateDetails() {
    userDetailsRef.child("${user!.uid}/isFirstTime").set(false);
  }
  // void checkIfFirstTime(UserDetails userDetails) async {
  //   final snapshot = await userDetailsRef.child(userDetails.userid).get();
  //   print(snapshot);
  // }
}
