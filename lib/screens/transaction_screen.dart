import 'dart:ui';

import 'package:flutter/material.dart';

import '../constant.dart';
import '../styles.dart';

class TransactionScreen extends StatefulWidget {
  TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  void onPressed() {}
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double computedHeight = screenHeight * 0.3;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            // leading: Icon(Icons.arrow_back, color: Colors.white),
            foregroundColor: background,
            backgroundColor: Colors.red,
            elevation: 0,
            title: Row(
              children: [
                Expanded(
                    child: Center(
                        child: Text("Detail Transaction",
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: background)))),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                        barrierColor: Color.fromARGB(66, 0, 0, 0),
                        enableDrag: true,
                        context: context,
                        builder: (BuildContext builder) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: Container(
                              height: 200.0,
                              color: background,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.drag_handle_rounded),
                                  Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Text(
                                      "Remove this transaction?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(
                                              decoration: TextDecoration.none,
                                              color: onPrimary),
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text:
                                            "Are you sure do you wanna remove this \n transaction?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    textAlign: TextAlign.center,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: background),
                                                onPressed: onPressed,
                                                child: Text("No",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ))),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(
                                                onPressed: onPressed,
                                                child: Text("Yes",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                          color: background,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ))),
                                          ),
                                        )
                                      ]),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Icon(
                    Icons.delete,
                  ),
                )
              ],
            )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: computedHeight,
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Buy some groceries",
                            style: TextStyle(fontSize: 24.0),
                          ),
                          Text(
                            "Saturday 4 June 2022",
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "P 5000.00",
                          style: TextStyle(fontSize: 35.8),
                        ),
                      ),
                    ),
                    Table(
                      children: [
                        TableRow(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            children: [
                              Center(child: Text("Type")),
                              Center(child: Text("Category")),
                              Center(child: Text("Wallet"))
                            ]),
                        TableRow(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            children: [
                              Center(child: Text("Expense")),
                              Center(child: Text("Salary")),
                              Center(child: Text("Chase"))
                            ])
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
