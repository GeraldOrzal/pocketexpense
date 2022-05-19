import 'package:flutter/material.dart';
import 'package:pocketexpense/widgets/custom_carousel.dart';
import 'package:pocketexpense/widgets/pageview_screen.dart';
import '../styles.dart';

const TOP_PAD = 5.0;
const LEFT_PAD = 20.0;
const BOTTOM_PAD = 5.0;
const RIGHT_PAD = 20.0;

class EntryScreen extends StatelessWidget {
  EntryScreen({Key? key}) : super(key: key);

  final Map<String, String> _imagePaths = {
    "assets/images/slide1.png": "Make a better budget",
    "assets/images/slide2.png": "You will spend mindfully",
    "assets/images/slide3.png": "Tracking your financial progress"
  };
  void _onPressed() {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCarousel(
              imagePaths: this._imagePaths,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    LEFT_PAD, TOP_PAD + 20, RIGHT_PAD, BOTTOM_PAD),
                child: ElevatedButton(
                  onPressed: _onPressed,
                  style: AuthStyle.getButtonStyle1,
                  child:
                      const Text("Register", style: AuthStyle.getButtonText1),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    LEFT_PAD, TOP_PAD, RIGHT_PAD, BOTTOM_PAD),
                child: ElevatedButton(
                  onPressed: _onPressed,
                  style: AuthStyle.getButtonStyle1,
                  child: const Text("Login", style: AuthStyle.getButtonText1),
                ))
          ],
        ),
      ),
    );
  }
}
