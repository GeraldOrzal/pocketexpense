import 'package:flutter/material.dart';

class BottomRowItems extends StatefulWidget {
  Function callBack;
  BottomRowItems({Key? key, required this.callBack}) : super(key: key);

  @override
  State<BottomRowItems> createState() => _BottomRowItemsState();
}

class _BottomRowItemsState extends State<BottomRowItems> {
  int currentIndex = 0;

  void _onTap(index) {
    widget.callBack(index);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => {_onTap(0)},
          child: Container(
            decoration: BoxDecoration(
                color:
                    currentIndex == 0 ? Color.fromRGBO(252, 238, 212, 1) : null,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
              child: Text(
                "Today",
                style: TextStyle(
                    color: currentIndex == 0
                        ? Color.fromRGBO(252, 172, 18, 1)
                        : Colors.black),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => {_onTap(1)},
          child: Container(
            decoration: BoxDecoration(
                color:
                    currentIndex == 1 ? Color.fromRGBO(252, 238, 212, 1) : null,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
              child: Text(
                "Week",
                style: TextStyle(
                    color: currentIndex == 1
                        ? Color.fromRGBO(252, 172, 18, 1)
                        : Colors.black),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => {_onTap(2)},
          child: Container(
            decoration: BoxDecoration(
                color:
                    currentIndex == 2 ? Color.fromRGBO(252, 238, 212, 1) : null,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
              child: Text(
                "Month",
                style: TextStyle(
                    color: currentIndex == 2
                        ? Color.fromRGBO(252, 172, 18, 1)
                        : Colors.black),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => {_onTap(3)},
          child: Container(
            decoration: BoxDecoration(
                color:
                    currentIndex == 3 ? Color.fromRGBO(252, 238, 212, 1) : null,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
              child: Text(
                "Year",
                style: TextStyle(
                    color: currentIndex == 3
                        ? Color.fromRGBO(252, 172, 18, 1)
                        : Colors.black),
              ),
            ),
          ),
        )
      ],
    );
  }
}
