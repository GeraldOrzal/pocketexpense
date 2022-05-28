import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocketexpense/styles.dart';

// ignore: must_be_immutable
class TransactionAppBarNav extends StatefulWidget
    implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  String header;
  Color color;
  TransactionAppBarNav({Key? key, required this.header, required this.color})
      : super(key: key);

  @override
  State<TransactionAppBarNav> createState() => _TransactionAppBarNavState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

class _TransactionAppBarNavState extends State<TransactionAppBarNav> {
  void _onChanged(data) {}

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.color,
      elevation: 0,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Text(
            widget.header,
            style: FontStyle.getHeader1(Colors.black),
          ),
          SvgPicture.asset('assets/images/notification.svg')
        ],
      ),
    );
  }
}
