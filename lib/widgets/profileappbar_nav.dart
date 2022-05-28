import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileAppBarNav extends StatefulWidget implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  ProfileAppBarNav({Key? key}) : super(key: key);

  @override
  State<ProfileAppBarNav> createState() => _ProfileAppBarNavState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

class _ProfileAppBarNavState extends State<ProfileAppBarNav> {
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
          DropdownButton(
            value: 1,
            hint: Text("Month"),
            items: [
              DropdownMenuItem(
                child: Text("January"),
                value: 1,
              ),
              DropdownMenuItem(child: Text("February"), value: 2),
              DropdownMenuItem(child: Text("March"), value: 3),
              DropdownMenuItem(child: Text("April"), value: 4),
            ],
            onChanged: _onChanged,
          ),
          SvgPicture.asset('assets/images/notification.svg')
        ],
      ),
    );
  }
}
