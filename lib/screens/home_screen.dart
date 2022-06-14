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

  List<Color> gradientColors = [
    const Color(0x8B50FF),
    Color.fromARGB(255, 245, 244, 244),
  ];

  @override
  Widget build(BuildContext context) {
    List<Transaction>? allTransaction =
        context.watch<TransactionsProvider>().allTransactions;
    List<FlSpot> generateData() {
      List<FlSpot> list = [];
      allTransaction?.reversed.forEach((element) {
        list.add(FlSpot(
            DateTime.parse(element.timestamp as String)
                .millisecondsSinceEpoch
                .toDouble(),
            element.amount.toDouble()));
      });

      return list;
    }

    LineChartData getChartData() {
      return LineChartData(
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          gridData: FlGridData(
            show: false,
            drawVerticalLine: false,
            horizontalInterval: 1,
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          lineBarsData: [
            LineChartBarData(
              color: Colors.red,
              spots: generateData(),
              isCurved: true,
              // gradient: LinearGradient(
              //   colors: gradientColors,
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              // ),
              barWidth: 5,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ]);
    }

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
                          child: LineChart(
                            getChartData(),
                            swapAnimationDuration:
                                const Duration(milliseconds: 150), // Optional
                            swapAnimationCurve: Curves.linear, // Optional
                          ),
                        ),
                      ),
                      BottomRowItems()
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
                children: renderAllTransactions(),
                scrollDirection: Axis.vertical,
              ),
            )
          ]),
    );
  }
}
