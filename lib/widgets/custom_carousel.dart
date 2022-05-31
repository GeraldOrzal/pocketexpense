import 'package:flutter/material.dart';

import 'pageview_screen.dart';

class CustomCarousel extends StatefulWidget {
  List? imagePaths;
  int? listCount;
  bool isEntryScreen;
  List<Widget> widgetsList;
  CustomCarousel(
      {Key? key,
      this.imagePaths,
      required this.isEntryScreen,
      this.listCount,
      required this.widgetsList})
      : super(key: key);

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int currentIndex = 0;
  int tempIndex = 0;

  List<Widget> generateWidgets(data) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < data.length; i++) {
      list.add(PageViewScreen(path: data[i]['path'], text: data[i]['text']));
    }

    return list;
  }

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
    List<Widget> generateCircle(data) {
      List<Widget> listofCircle = <Widget>[];
      for (var i = 0; i < data; i++) {
        listofCircle.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: currentIndex == i ? 20.0 : 10.0,
                height: currentIndex == i ? 20.0 : 10.0,
                padding: const EdgeInsets.all(20.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  //      ,
                  color: Color.fromRGBO(220, 4, 25, 1),
                )),
          ),
        );
      }

      return listofCircle;
    }

    return Column(
      children: [
        Container(
          height: 300.0,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            children: widget.isEntryScreen
                ? generateWidgets(widget.imagePaths)
                : widget.widgetsList,
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: generateCircle(widget.isEntryScreen
                ? widget.imagePaths?.length
                : widget.listCount))
      ],
    );
  }
}
