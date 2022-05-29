import 'package:flutter/material.dart';
import 'package:pocketexpense/styles.dart';
import 'package:pocketexpense/constant.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(30, 140, 100, 20),
              child: Text(
                "First we need to setup your account",
                style: TxtStyle.getWelcomeTxt(const Color.fromRGBO(0, 0, 0, 1)),
              )),
          GestureDetector(
            onTap: () => {Navigator.popAndPushNamed(context, crtAccountScreen)},
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 20, 20, 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(),
                  Text(
                    "Let's go!",
                    style: TxtStyle.getBtnNext,
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
