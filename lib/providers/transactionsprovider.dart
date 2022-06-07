import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import '../models/account.dart';
import '../models/userdetails.dart';

class TransactionsProvider extends ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;
  DatabaseReference accountRef =
      FirebaseDatabase.instance.ref().child('transactions');
}
