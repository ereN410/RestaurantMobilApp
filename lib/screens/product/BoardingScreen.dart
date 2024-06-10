import 'package:flutter/material.dart';

class BoardingScreen extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  int currentIndex = 0;

  final List<Map<String, String>> boardingData = [
    {
      "title": "Welcome to Our Restaurant App",
      "description": "Discover the best restaurants around you.",
      "image": "assets/images/boarding1.jpeg"
    },
    {
      "title": "Choose Your Favorite",
      "description": "Browse menus and select your favorite meals.",
      "image": "assets/images/boarding2.jpeg"
    },
    {
      "title": "Order Easily",
      "description": "Order food from the comfort of your home.",
      "image": "assets/images/boarding3.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: boardingData.length,
                itemBuilder: (context, index) => BoardingContent(
                  image: boardingData[index]["image"],
                  title: boardingData[index]["title"],
                  description: boardingData[index]["description"],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                boardingData.length,
                (index) => buildDot(index: index),
              ),
            ),
            SizedBox(height: 20),
            currentIndex == boardingData.length - 1
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Text("Get Started"),
                  )
                : Container(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildDot({required int index}) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: currentIndex == index ? 20 : 10,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class BoardingContent extends StatelessWidget {
  final String? image, title, description;

  BoardingContent({this.image, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset(image!),
        ),
        Text(
          title!,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          description!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
