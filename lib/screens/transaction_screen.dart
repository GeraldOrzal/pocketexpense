import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pocketexpense/widgets/dashline.dart';

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
              padding: EdgeInsets.only(bottom: 8.0),
              height: computedHeight,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
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
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    fontSize: 24.0,
                                    color: background,
                                    fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "Saturday 4 June 2022",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: background),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "₱ 5,000.00",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 38.1, color: background),
                        ),
                      ),
                    ),
                    Table(
                      children: [
                        TableRow(
                            decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0))),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text("Type",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Color.fromRGBO(
                                                    145, 145, 159, 1)))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text("Category",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Color.fromRGBO(
                                                    145, 145, 159, 1)))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text("Wallet",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Color.fromRGBO(
                                                    145, 145, 159, 1)))),
                              )
                            ]),
                        TableRow(
                            decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0))),
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                    child: Text("Expense",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0,
                                                color: onPrimary))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                    child: Text("Salary",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0,
                                                color: onPrimary))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                    child: Text("Chase",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0,
                                                color: onPrimary))),
                              )
                            ])
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: DashLine(
                  height: 1.0, color: Color.fromRGBO(145, 145, 159, 1)),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("Description",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Color.fromRGBO(145, 145, 159, 1),
                            fontSize: 16.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 16.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Attachment",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color.fromRGBO(145, 145, 159, 1),
                          fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Image.asset("assets/images/receipt.png"),
                  ),
                  ElevatedButton(
                      onPressed: onPressed,
                      child: Text(
                        "Edit",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: background, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
