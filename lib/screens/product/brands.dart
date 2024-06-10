import 'package:flutter/material.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' anlaşmalı Markalar'), // Title changed to "Anlaşmalı Markalar"
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell( // Wrap each button with InkWell for click effect
              onTap: () {
                // No navigation action here
                // You can add a snackbar or show a dialog here if needed
              },
              child: Ink.image(
                image: AssetImage('assets/images/sutis_logo.png'),
                fit: BoxFit.cover,
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text('', style: TextStyle(fontSize: 24.0)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                // No navigation action here
              },
              child: Ink.image(
                image: AssetImage('assets/images/beyazfirin_logo.png'),
                fit: BoxFit.cover,
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text('', style: TextStyle(fontSize: 24.0)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                // No navigation action here
              },
              child: Ink.image(
                image: AssetImage('assets/images/bigchef_logo.png'),
                fit: BoxFit.cover,
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text('', style: TextStyle(fontSize: 24.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
