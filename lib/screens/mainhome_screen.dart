import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/models/transaction.dart' as TransactionDetails;
import 'package:pocketexpense/screens/home_screen.dart';
import 'package:pocketexpense/screens/profile_screen.dart';
import 'package:pocketexpense/screens/setting_screen.dart';
import 'package:pocketexpense/screens/transactionlist_screen.dart';

import 'package:pocketexpense/widgets/topbar_nav.dart';
import 'package:provider/provider.dart';

import '../providers/accountprovider.dart';
import '../providers/transactionsprovider.dart';
import '../providers/userprovider.dart';

class MainHomeScreen extends StatefulWidget {
  MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int currentIndex = 0;
  void initState() {
    var subscription = FirebaseDatabase.instance
        .ref()
        .child('transactions/${FirebaseAuth.instance.currentUser!.uid}')
        .onChildAdded
        .listen((event) {
      if (event.type == DatabaseEventType.childAdded) {
        TransactionDetails.Transaction currentTransaction =
            TransactionDetails.Transaction.fromJson(
                jsonEncode(event.snapshot.value));
        if (currentTransaction.transactionType == "Transfer") {
          Provider.of<TransactionsProvider>(context, listen: false)
              .addTransaction(currentTransaction);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);
    pageController.addListener(() => {
          if (pageController.page! % 1 == 0)
            {
              setState(() {
                currentIndex = pageController.page!.toInt();
              })
            }
        });

    void _onTap(newValue) {
      pageController.animateToPage(newValue,
          curve: Curves.ease, duration: Duration(milliseconds: 700));
      setState(() {
        currentIndex = newValue;
      });
    }

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () => {_onTap(0)},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MdiIcons.home,
                            color: currentIndex == 0 ? Colors.red : Colors.grey,
                          ),
                          Text(
                            'Home',
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: currentIndex == 0
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () => {_onTap(1)},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MdiIcons.swapHorizontalBold,
                            color: currentIndex == 1 ? Colors.red : Colors.grey,
                          ),
                          Text(
                            'Transaction',
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: currentIndex == 1
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () => {_onTap(2)},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MdiIcons.cog,
                            color: currentIndex == 2 ? Colors.red : Colors.grey,
                          ),
                          Text(
                            'Settings',
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: currentIndex == 2
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () => {_onTap(3)},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MdiIcons.account,
                            color: currentIndex == 3 ? Colors.red : Colors.grey,
                          ),
                          Text(
                            'Profile',
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: currentIndex == 3
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          onPressed: (() {
            _tripModalBottomSheet(context);
          }),
          child: const Icon(
            MdiIcons.plus,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: [
            HomeScreen(
              callback: _onTap,
            ),
            TransactionListScreen(),
            SettingScreen(),
            ProfileScreen()
          ],
        ),
      ),
    );
  }
}

void _tripModalBottomSheet(context) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      context: context,
      builder: (BuildContext context) {
        return Container(
          // padding: const EdgeInsets.only(
          //   left: 0,
          //   top: 0,
          //   bottom: 0,
          //   right: 0,
          // ),
          height: MediaQuery.of(context).size.height * .35,
          decoration: const BoxDecoration(
              color: Color.fromARGB(245, 245, 245, 245),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            children: [
              const Center(
                child: Icon(
                  MdiIcons.minus,
                  color: Colors.grey,
                  size: 32,
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushNamed(context, expenseRoute,
                          arguments: <String, String>{
                            "transactionType": "Expense"
                          })
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            MdiIcons.cashMinus,
                            color: background,
                            size: 36,
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Text(
                            'Expense',
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushNamed(context, expenseRoute,
                          arguments: <String, String>{
                            "transactionType": "Income"
                          })
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        color: income,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            MdiIcons.cashPlus,
                            color: background,
                            size: 36,
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Text(
                            'Income',
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushNamed(context, transferRoute,
                          arguments: {"transactionType": "Transfer"})
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        color: transfer,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            MdiIcons.cashFast,
                            color: background,
                            size: 36,
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Text(
                            'Transfer',
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
