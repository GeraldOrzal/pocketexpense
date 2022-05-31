import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/styles.dart';
import 'package:pocketexpense/widgets/bottombar_nav.dart';
import 'package:pocketexpense/widgets/topbar_nav.dart';
import 'package:pocketexpense/widgets/transaction_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TopBarNav(),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Spend Frequency",
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: 470,
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
                    )
                  ],
                ),
              ),
              Container(
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: const [
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
        bottomNavigationBar: BottomBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            _tripModalBottomSheet(context);
          }),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
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
