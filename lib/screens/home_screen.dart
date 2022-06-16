import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/helpers/TextFormatter.dart';
import 'package:pocketexpense/models/transaction.dart';
import 'package:pocketexpense/styles.dart';
import 'package:provider/provider.dart';
import 'package:pocketexpense/widgets/bottomrowitems.dart';
import 'package:pocketexpense/widgets/topbar_nav.dart';
import 'package:pocketexpense/widgets/transaction_box.dart';
import 'package:fl_chart/fl_chart.dart';

import '../providers/accountprovider.dart';
import '../providers/transactionsprovider.dart';
import '../widgets/chart.dart';
import '../widgets/custom_carousel.dart';

class HomeScreen extends StatefulWidget {
  Function callback;
  HomeScreen({Key? key, required this.callback}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // initState() {
  //   allTransaction = context.watch<TransactionsProvider>().allTransactions;
  // }

  String filterData = "today";
  List filter = ["today", "week", "month", "year"];

  void onPressed(data) {
    setState(() {
      filterData = filter[data];
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Transaction>? allTransaction =
        context.watch<TransactionsProvider>().allTransactions;

    List<TransactionBox> renderAllTransactions() {
      List<TransactionBox> list = [];
      List<Transaction> tempList =
          context.watch<TransactionsProvider>().allTransactions;

      for (var i = 0; i < tempList.length; i++) {
        list.add(TransactionBox(transaction: tempList[i]));
      }
      return list;
    }

    return Scaffold(
      appBar: TopBarNav(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomCarousel(
              isEntryScreen: false,
              listCount: 2,
              widgetsList: [
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Spend Frequency",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ChartWidget(
                            filterData: filterData,
                          ),
                        ),
                      ),
                      BottomRowItems(
                        callBack: onPressed,
                      )
                    ],
                  ),
                ),
                Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      const Text("Account Balance"),
                      Text(
                          "₱ ${TextFormatter.formatNumber(context.watch<AccountProvider>().totalAmount.toStringAsFixed(2))}",
                          style: Theme.of(context).textTheme.headline1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  color: Color.fromRGBO(217, 154, 61, 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(children: [
                                  Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color: Colors.white,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.send),
                                      )),
                                  Text(
                                    'Income \n ₱ ${TextFormatter.formatNumber(context.watch<TransactionsProvider>().allIncome.toStringAsFixed(2))}',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ]),
                              )),
                          Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  color: Colors.red),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color: Colors.white,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.send),
                                          )),
                                      Text(
                                          'Expenses \n ₱ ${TextFormatter.formatNumber(context.watch<TransactionsProvider>().allExpense.toStringAsFixed(2))}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1)
                                    ]),
                              ))
                        ],
                      )
                    ]))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Transaction",
                      style: Theme.of(context).textTheme.headline2),
                  GestureDetector(
                    onTap: () => {widget.callback(1)},
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 238, 121, 113),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "See All",
                          style:
                              TextStyle(color: Color.fromARGB(255, 252, 18, 1)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 200.0,
              child: ListView(
                semanticChildCount: 2,
                children: renderAllTransactions(),
                scrollDirection: Axis.vertical,
              ),
            )
          ]),
    );
  }
}
