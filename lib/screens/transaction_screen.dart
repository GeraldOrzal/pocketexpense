import 'package:flutter/material.dart';
import 'package:pocketexpense/widgets/transactionappbar_nav.dart';

import '../constant.dart';
import '../styles.dart';

class TransactionScreen extends StatefulWidget {
  TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double computedHeight = screenHeight * CONTAINER_PERCENTAGE;
    return SafeArea(
      child: Scaffold(
        appBar: TransactionAppBarNav(
          header: "Detail Transaction",
          color: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: computedHeight,
              decoration: LayoutStyle.getUpperStyle(Colors.red),
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
