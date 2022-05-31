import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';

class BottomBar extends StatefulWidget {
  Function callback;
  int currentIndex;
  BottomBar({Key? key, required this.callback, required this.currentIndex})
      : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
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
                  onPressed: () => {widget.callback(0)},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color:
                            widget.currentIndex == 0 ? Colors.red : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: widget.currentIndex == 0
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () => {widget.callback(1)},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.code,
                        color:
                            widget.currentIndex == 1 ? Colors.red : Colors.grey,
                      ),
                      Text(
                        'Transaction',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: widget.currentIndex == 1
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
                  onPressed: () => {widget.callback(2)},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        color:
                            widget.currentIndex == 2 ? Colors.red : Colors.grey,
                      ),
                      Text(
                        'Settings',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: widget.currentIndex == 2
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () => {widget.callback(3)},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        color:
                            widget.currentIndex == 3 ? Colors.red : Colors.grey,
                      ),
                      Text(
                        'Profile',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: widget.currentIndex == 3
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
    );
  }
}
