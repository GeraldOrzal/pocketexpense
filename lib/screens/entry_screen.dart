import 'package:flutter/material.dart';
import 'package:pocketexpense/widgets/custom_carousel.dart';
import 'package:pocketexpense/widgets/pageview_screen.dart';

class EntryScreen extends StatelessWidget {
  EntryScreen({Key? key}) : super(key: key);

  final Map<String, String> _imagePaths = {
    "assets/images/slide1.png": "Make a better budget",
    "assets/images/slide2.png": "You will spend mindfully",
    "assets/images/slide3.png": "Tracking your financial progress"
  };

  @override
  Widget build(BuildContext context) {
    _imagePaths.keys.map((e) => {debugPrint(e)});

    return SafeArea(
      child: Scaffold(
        body: CustomCarousel(
          imagePaths: this._imagePaths,
        ),
      ),
    );
  }
}
