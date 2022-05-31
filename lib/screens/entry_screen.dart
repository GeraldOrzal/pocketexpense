import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/widgets/custom_carousel.dart';
import 'package:pocketexpense/widgets/pageview_screen.dart';
import '../styles.dart';

class EntryScreen extends StatelessWidget {
  EntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List items = jsonDecode(entryScreenItems);

    void _onPressed(data) {
      if (data == "LOGIN") {
        Navigator.pushNamed(context, loginRoute);
      } else {
        Navigator.pushNamed(context, registerRoute);
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCarousel(
              imagePaths: items,
              isEntryScreen: true,
              widgetsList: [],
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    leftPad, topPad + 30, rightPad, bottomPad),
                child: ElevatedButton(
                    onPressed: () => {_onPressed("REGISTER")},
                    child: Text("Register",
                        style: Theme.of(context).textTheme.button))),
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    leftPad, topPad, rightPad, bottomPad),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: secondary),
                  onPressed: () => {_onPressed("LOGIN")},
                  child: Text("Login",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: primary)),
                ))
          ],
        ),
      ),
    );
  }
}
