import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/widgets/custom_carousel.dart';
import 'package:pocketexpense/widgets/pageview_screen.dart';
import '../styles.dart';

class EntryScreen extends StatelessWidget {
  EntryScreen({Key? key}) : super(key: key);

  final Map<String, String> _imagePaths = {
    "assets/images/slide1.png": "Make a better budget",
    "assets/images/slide2.png": "You will spend mindfully",
    "assets/images/slide3.png": "Tracking your financial progress"
  };

  @override
  Widget build(BuildContext context) {
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
              imagePaths: this._imagePaths,
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    leftPad, topPad + 30, rightPad, bottomPad),
                child: ElevatedButton(
                  onPressed: () => {_onPressed("REGISTER")},
                  style: BtnStyle.getButtonStyle1,
                  child: const Text("Register", style: TxtStyle.getButtonText1),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    leftPad, topPad, rightPad, bottomPad),
                child: ElevatedButton(
                  onPressed: () => {_onPressed("LOGIN")},
                  style: BtnStyle.getButtonStyle2,
                  child: const Text("Login", style: TxtStyle.getButtonText2),
                ))
          ],
        ),
      ),
    );
  }
}
