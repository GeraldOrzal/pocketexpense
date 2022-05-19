import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNav extends StatefulWidget {
  BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
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
      notchMargin: 5,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: IconButton(
              onPressed: () => {_onPressed(0)},
              icon: SvgPicture.asset(
                'assets/images/home.svg',
                color: currentIndex == 0
                    ? Colors.red
                    : Color.fromRGBO(198, 198, 198, 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
            child: IconButton(
              onPressed: () => {_onPressed(1)},
              icon: SvgPicture.asset(
                'assets/images/transaction.svg',
                color: currentIndex == 1
                    ? Colors.red
                    : Color.fromRGBO(198, 198, 198, 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: IconButton(
              onPressed: () => {_onPressed(2)},
              icon: SvgPicture.asset(
                'assets/images/settings.svg',
                color: currentIndex == 2
                    ? Colors.red
                    : Color.fromRGBO(198, 198, 198, 1),
              ),
            ),
          ),
          Expanded(
            child: IconButton(
                onPressed: () => {_onPressed(3)},
                icon: SvgPicture.asset(
                  'assets/images/user.svg',
                  color: currentIndex == 3
                      ? Colors.red
                      : Color.fromRGBO(198, 198, 198, 1),
                )),
          )
        ],
      ),
    );
  }
}
