import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: background,
          elevation: 0,
          title: Row(children: [
            Expanded(
                child: Align(
                    alignment: Alignment.center, child: Text("Notification"))),
            Icon(Icons.filter_alt_off)
          ]),
        ),
        body: ListView(
          children: [Text("No notification to show")],
        ),
      ),
    );
  }
}
