import 'package:flutter/material.dart';
import 'package:pocketexpense/styles.dart';

class PageViewScreen extends StatelessWidget {
  String? path;
  String? text;
  PageViewScreen({
    Key? key,
    this.path,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(child: Image.asset(this.path ?? "default")),
        Center(
          child: Text(
            this.text ?? "default",
            style: TxtStyle.getBodyText1(22, Colors.black),
          ),
        ),
      ],
    );
  }
}
