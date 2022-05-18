import 'package:flutter/material.dart';

import 'pageview_screen.dart';

class CustomCarousel extends StatefulWidget {
  Map<String, String>? imagePaths;

  CustomCarousel({Key? key, this.imagePaths}) : super(key: key);

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
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

    return Column(
      children: [
        Container(
          height: 300.0,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            children: widget.imagePaths!.entries.map((entry) {
              return PageViewScreen(path: entry.key, text: entry.value);
            }).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: this.currentIndex == 0 ? 20.0 : 10.0,
                  height: this.currentIndex == 0 ? 20.0 : 10.0,
                  padding: const EdgeInsets.all(20.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    //      ,
                    color: Colors.red,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: this.currentIndex == 1 ? 20.0 : 10.0,
                  height: this.currentIndex == 1 ? 20.0 : 10.0,
                  padding: const EdgeInsets.all(20.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    //      ,
                    color: Colors.red,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: this.currentIndex == 2 ? 20.0 : 10.0,
                  height: this.currentIndex == 2 ? 20.0 : 10.0,
                  padding: const EdgeInsets.all(20.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    //      ,
                    color: Colors.red,
                  )),
            )
          ],
        )
      ],
    );
  }
}
