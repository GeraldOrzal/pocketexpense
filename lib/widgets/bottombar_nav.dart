import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  void _onPressed(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
                  onPressed: () => {_onPressed(0)},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: currentIndex == 0 ? Colors.red : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                            color:
                                currentIndex == 0 ? Colors.red : Colors.grey),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () => {_onPressed(1)},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.code,
                        color: currentIndex == 1 ? Colors.red : Colors.grey,
                      ),
                      Text(
                        'Transaction',
                        style: TextStyle(
                            color:
                                currentIndex == 1 ? Colors.red : Colors.grey),
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
                  onPressed: () => {_onPressed(2)},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        color: currentIndex == 2 ? Colors.red : Colors.grey,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                            color:
                                currentIndex == 2 ? Colors.red : Colors.grey),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () => {_onPressed(3)},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: currentIndex == 3 ? Colors.red : Colors.grey,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                            color:
                                currentIndex == 3 ? Colors.red : Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
