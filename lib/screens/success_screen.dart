import 'package:flutter/material.dart';
import 'package:pocketexpense/styles.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.check_circle,
              size: 190,
              color: Colors.green,
            ),
            Text(
              "You are all set!",
              style: TxtStyle.getSuceessTxt,
            )
          ],
        ),
      )),
    );
  }
}
