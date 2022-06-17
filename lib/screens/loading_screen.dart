import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: SpinKitFadingCircle(
            size: 50.0,
            color: Colors.white,
          ),
        ));
  }
}
