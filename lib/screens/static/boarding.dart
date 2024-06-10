import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../../core/storage.dart';
import '../../widgets/page/boarding_item.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final List<Map<String, String>> boardingData = [
    {
      "title": "Welcome to Our Restaurant App",
      "description": "Discover the best restaurants around you.",
      "image": "assets/images/boarding1.jpg"
    },
    {
      "title": "Choose Your Favorite",
      "description": "Browse menus and select your favorite meals.",
      "image": "assets/images/boarding2.jpg"
    },
    {
      "title": "Order Easily",
      "description": "Order food from the comfort of your home.",
      "image": "assets/images/boarding3.jpg"
    },
  ];

  int page = 0;
  final PreloadPageController _pageController = PreloadPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () async {
                if (page == boardingData.length - 1) {
                  final storage = Storage();
                  await storage.firstLauched();
                  GoRouter.of(context).replace("/login");
                } else {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: page == boardingData.length - 1
                    ? const Text("finish")
                    : const Text("skip"),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: PreloadPageView.builder(
          controller: _pageController,
          itemCount: boardingData.length,
          preloadPagesCount: boardingData.length,
          onPageChanged: (value) {
            setState(() {
              page = value;
            });
          },
          itemBuilder: (context, index) => BoardingItem(
            image: boardingData[index]["image"]!,
            title: boardingData[index]["title"]!,
            description: boardingData[index]["description"]!,
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Align(
          alignment: Alignment.center,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: boardingData.length,
            itemBuilder: (context, index) => Icon(
              page == index
                  ? CupertinoIcons.circle_filled
                  : CupertinoIcons.circle,
            ),
          ),
        ),
      ),
    );
  }
}
