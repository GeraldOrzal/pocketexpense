import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/styles.dart';
import 'package:pocketexpense/widgets/bottombar_nav.dart';
import 'package:pocketexpense/widgets/bottomrowitems.dart';
import 'package:pocketexpense/widgets/topbar_nav.dart';
import 'package:pocketexpense/widgets/transaction_box.dart';
import 'package:fl_chart/fl_chart.dart';

import '../widgets/custom_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> gradientColors = [
    const Color(0x8B50FF),
    Color.fromARGB(255, 245, 244, 244),
  ];
  LineChartData get sampleData1 => LineChartData(
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
              spots: const [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 3.1),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
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

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          sampleData1,
                          swapAnimationDuration:
                              Duration(milliseconds: 150), // Optional
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
                    Text("Account Balance"),
                    Text("₱ 9,400",
                        style: Theme.of(context).textTheme.headline1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Color.fromRGBO(217, 154, 61, 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(children: [
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.send),
                                    )),
                                Text(
                                  'Income \n ₱ 5000',
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              ]),
                            )),
                        Container(
                            decoration: BoxDecoration(
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
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.send),
                                        )),
                                    Text('Expenses \n ₱ 5000',
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
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 238, 121, 113),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "See All",
                      style: TextStyle(color: Color.fromARGB(255, 252, 18, 1)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                TransactionBox(
                  isExpense: true,
                ),
                TransactionBox(
                  isExpense: false,
                ),
              ],
            ),
          )
        ]);
  }
}

void _tripModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height * .35,
            child: const Text("Add"));
      });
}
