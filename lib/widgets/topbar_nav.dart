import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/styles.dart';

class TopBarNav extends StatefulWidget implements PreferredSizeWidget {
  final AppBar topBar = AppBar();
  Function callBack;
  int? initData;
  TopBarNav({Key? key, required this.callBack, this.initData})
      : super(key: key);

  @override
  State<TopBarNav> createState() => _TopBarNavState();
  Size get preferredSize => Size.fromHeight(topBar.preferredSize.height);
}

class _TopBarNavState extends State<TopBarNav> {
  int? currentMonth;
  @override
  void initState() {
    // TODO: implement initState

    currentMonth = widget.initData;
  }

  void _onChanged(data) {
    widget.callBack(data);
    setState(() {
      currentMonth = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.black12,
      elevation: 0,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: primary),
                borderRadius: BorderRadius.all(Radius.circular(200.0))),
            padding: EdgeInsets.all(2.0),
            child: Image.asset(
              "assets/images/logo.png",
              scale: 4,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 10,
              top: 0,
              bottom: 0,
              right: 0,
            ),
            child: DropdownButton(
              style: Theme.of(context).textTheme.bodyText2,
              value: currentMonth,
              hint: const Text("Month"),
              items: const [
                DropdownMenuItem(
                    value: 0,
                    child: Text(
                      "January",
                    )),
                DropdownMenuItem(value: 1, child: Text("February")),
                DropdownMenuItem(value: 2, child: Text("March")),
                DropdownMenuItem(value: 3, child: Text("April")),
                DropdownMenuItem(value: 4, child: Text("May")),
                DropdownMenuItem(value: 5, child: Text("June")),
                DropdownMenuItem(value: 6, child: Text("July")),
                DropdownMenuItem(value: 7, child: Text("August")),
                DropdownMenuItem(value: 8, child: Text("September")),
                DropdownMenuItem(value: 9, child: Text("October")),
                DropdownMenuItem(value: 10, child: Text("November")),
                DropdownMenuItem(value: 11, child: Text("December")),
              ],
              onChanged: _onChanged,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(notificationRoute);
            },
            child: const Icon(
              Icons.notifications,
              color: primary,
              size: 32,
            ),
          )
        ],
      ),
    );
  }
}
