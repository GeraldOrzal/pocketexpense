import 'package:flutter/material.dart';
import 'package:pocketexpense/styles.dart';
import 'package:pocketexpense/widgets/appbar_nav.dart';
import 'package:pocketexpense/widgets/bottom_nav.dart';
import 'package:pocketexpense/widgets/transaction_box.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void _onPressed() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarNav(),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Spend Frequency",
                style: FontStyle.getHeader1(Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recent Transaction",
                        style: FontStyle.getHeader1(Colors.black)),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "See All",
                          style:
                              TextStyle(color: Color.fromARGB(255, 252, 18, 1)),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 238, 121, 113),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    )
                  ],
                ),
              ),
              Container(
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    TransactionBox(),
                    TransactionBox(),
                    TransactionBox(),
                    TransactionBox(),
                    TransactionBox(),
                    TransactionBox(),
                    TransactionBox(),
                    TransactionBox(),
                    TransactionBox(),
                    TransactionBox(),
                    TransactionBox(),
                    TransactionBox(),
                  ],
                ),
              )
            ]),
        bottomNavigationBar: BottomNav(),
        floatingActionButton: FloatingActionButton(
          onPressed: _onPressed,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
