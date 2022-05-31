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

    callback(newValue) {
      pageController.jumpToPage(newValue);
      setState(() {
        currentIndex = newValue;
      });
    }

    return SafeArea(
      child: Scaffold(
        appBar: TopBarNav(),
        bottomNavigationBar: BottomBar(
          callback: callback,
          currentIndex: currentIndex,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            // _tripModalBottomSheet(context);
          }),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: PageView(
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
