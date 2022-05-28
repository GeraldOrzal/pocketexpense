import 'package:flutter/material.dart';
import 'package:pocketexpense/styles.dart';
import '../styles.dart';

class TransactionBox extends StatelessWidget {
  const TransactionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(255, 234, 234, 1),
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(6.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(" 12 \n May"),
                  ),
                ),
                Column(children: [
                  Text("Bumili ng Pares",
                      style: TxtStyle.getHeader1(Colors.black)),
                ]),
                const Text("-P20,000")
              ],
            ),
          ),
          decoration: new BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 1),
                  blurRadius: 5,
                )
              ],
              gradient: new LinearGradient(
                  stops: [0.02, 0.02], colors: [Colors.red, Colors.white]),
              borderRadius: new BorderRadius.all(const Radius.circular(6.0)))),
    );
  }
}
