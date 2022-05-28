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
        Navigator.pushNamed(context, LOGIN_ROUTE);
      } else {
        Navigator.pushNamed(context, REGISTER_ROUTE);
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
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    LEFT_PAD, TOP_PAD + 20, RIGHT_PAD, BOTTOM_PAD),
                child: ElevatedButton(
                  onPressed: () => {_onPressed("REGISTER")},
                  style: CustomButtonStyle.getButtonStyle1,
                  child:
                      const Text("Register", style: FontStyle.getButtonText1),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    LEFT_PAD, TOP_PAD, RIGHT_PAD, BOTTOM_PAD),
                child: ElevatedButton(
                  onPressed: () => {_onPressed("LOGIN")},
                  style: CustomButtonStyle.getButtonStyle2,
                  child: const Text("Login", style: FontStyle.getButtonText2),
                ))
          ],
        ),
      ),
    );
  }
}
