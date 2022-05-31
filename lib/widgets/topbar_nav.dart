import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/styles.dart';

class TopBarNav extends StatefulWidget implements PreferredSizeWidget {
  final AppBar topBar = AppBar();
  TopBarNav({Key? key}) : super(key: key);

  @override
  State<TopBarNav> createState() => _TopBarNavState();
  Size get preferredSize => Size.fromHeight(topBar.preferredSize.height);
}

class _TopBarNavState extends State<TopBarNav> {
  void _onChanged(data) {}
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/logo.png",
            scale: 3,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 10,
              top: 0,
              bottom: 0,
              right: 0,
            ),
            height: 35,
            width: 110,
            decoration: BoxStyle.getMonthBox,
            child: DropdownButton(
              value: 1,
              hint: const Text("Month"),
              items: const [
                DropdownMenuItem(value: 1, child: Text("January")),
                DropdownMenuItem(value: 2, child: Text("February")),
                DropdownMenuItem(value: 3, child: Text("March")),
                DropdownMenuItem(value: 4, child: Text("April")),
                DropdownMenuItem(value: 5, child: Text("May")),
                DropdownMenuItem(value: 6, child: Text("June")),
                DropdownMenuItem(value: 7, child: Text("July")),
                DropdownMenuItem(value: 8, child: Text("August")),
                DropdownMenuItem(value: 9, child: Text("September")),
                DropdownMenuItem(value: 10, child: Text("October")),
                DropdownMenuItem(value: 11, child: Text("November")),
                DropdownMenuItem(value: 12, child: Text("December")),
              ],
              onChanged: _onChanged,
            ),
          ),
          const Icon(
            Icons.notifications,
            size: 32,
          )
        ],
      ),
    );
  }
}
