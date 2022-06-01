import 'package:flutter/material.dart';
import 'package:pocketexpense/screens/home_screen.dart';
import 'package:pocketexpense/screens/profile_screen.dart';
import 'package:pocketexpense/screens/setting_screen.dart';
import 'package:pocketexpense/screens/transactionlist_screen.dart';
import 'package:pocketexpense/widgets/bottombar_nav.dart';
import 'package:pocketexpense/widgets/topbar_nav.dart';

class MainHomeScreen extends StatefulWidget {
  MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int currentIndex = 0;

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
          curve: Curves.ease, duration: Duration(milliseconds: 800));
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
                            Icons.home,
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
                            Icons.code,
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
                            Icons.settings,
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
                            Icons.account_circle,
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
          onPressed: (() {
            // _tripModalBottomSheet(context);
          }),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: [
            HomeScreen(),
            TransactionListScreen(),
            SettingScreen(),
            ProfileScreen()
          ],
        ),
      ),
    );
  }
}
