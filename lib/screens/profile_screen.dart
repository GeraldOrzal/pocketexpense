import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/providers/userprovider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void onPressed() {
    FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(entryRoute, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ElevatedButton(onPressed: onPressed, child: Text("Logout"))],
    );
  }
}
