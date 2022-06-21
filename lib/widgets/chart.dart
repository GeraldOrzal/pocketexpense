import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../models/transaction.dart';
import '../providers/transactionsprovider.dart';

class ChartWidget extends StatefulWidget {
  String filterData;
  ChartWidget({Key? key, required this.filterData}) : super(key: key);

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

class _ChartWidgetState extends State<ChartWidget> {
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
      Map<String, double> allData = {};
      DateTime today = DateTime.now();

      switch (widget.filterData) {
        case "month":
          allTransaction?.reversed.forEach((element) {
            if (element.transactionType != "Income") {
              DateTime date = DateTime.parse(element.timestamp as String);
              if (date.year == today.year) {
                if (allData[months[date.month]] == null) {
                  allData[months[date.month]] = element.amount.toDouble();
                } else {
                  allData[months[date.month]] = (allData[months[date.month]]! +
                      element.amount.toDouble());
                }
              }
            }
          });
          allData.forEach((key, value) {
            list.add(FlSpot(months.indexOf(key).toDouble(), value));
          });
          break;
        case "week":
          allTransaction?.reversed.forEach((element) {
            if (element.transactionType != "Income") {
              DateTime date = DateTime.parse(element.timestamp as String);
              if (date.year == today.year && date.month == today.month) {
                if (getDate(today.subtract(Duration(days: today.weekday - 1)))
                        .isBefore(date) &&
                    getDate(today.add(Duration(
                            days: DateTime.daysPerWeek - today.weekday)))
                        .isAfter(date)) {
                  print(today.subtract(Duration(days: today.weekday - 1)));
                  print(today.weekday);
                  if (allData[date.weekday.toString()] == null) {
                    allData[date.weekday.toString()] =
                        element.amount.toDouble();
                  } else {
                    allData[date.weekday.toString()] =
                        (allData[date.weekday.toString()]! +
                            element.amount.toDouble());
                  }
                }
              }
            }
          });

          allData.forEach((key, value) {
            list.add(FlSpot(double.parse(key), value));
          });
          break;
        case "year":
          allTransaction.forEach((element) {
            if (element.transactionType != "Income") {
              DateTime date = DateTime.parse(element.timestamp as String);
              if (allData[date.year.toString()] == null) {
                allData[date.year.toString()] = element.amount.toDouble();
              } else {
                allData[date.year.toString()] =
                    (allData[date.year.toString()]! +
                        element.amount.toDouble());
              }
            }
          });

          allData.forEach((key, value) {
            list.add(FlSpot(double.parse(key), value));
          });
          break;
        default:
          allTransaction?.reversed.forEach((element) {
            if (element.transactionType != "Income") {
              DateTime date = DateTime.parse(element.timestamp as String);

              if (date.month == today.month &&
                  date.day == today.day &&
                  date.year == today.year) {
                list.add(FlSpot(
                    DateTime.parse(element.timestamp as String)
                        .millisecondsSinceEpoch
                        .toDouble(),
                    element.amount.toDouble()));
              }
            }
          });

          break;
      }
      print(list);
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

    return LineChart(
      getChartData(),
      swapAnimationDuration: const Duration(milliseconds: 150), // Optional
      swapAnimationCurve: Curves.linear, // Optional
    );
  }
}
