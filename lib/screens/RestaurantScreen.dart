import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  bool isDarkMode = false;
  String language = 'en';

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void changeLanguage() {
    setState(() {
      language = language == 'tr' ? 'en' : 'tr';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Page'),
        actions: [
          IconButton(
            onPressed: () => GoRouter.of(context).push("/favorites"),
            icon: Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () => GoRouter.of(context).push("/cart"),
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () => GoRouter.of(context).push("/home"),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 16.0),
              IconButton(
                onPressed: () {
                  GoRouter.of(context).go('/baslangic');
                },
                icon: Icon(Icons.fastfood),
                tooltip: 'Başlangıçları Karşılaştır',
              ),
              SizedBox(width: 16.0),
              IconButton(
                onPressed: () {
                  GoRouter.of(context).go('/kahvalti');
                },
                icon: Icon(Icons.breakfast_dining),
                tooltip: 'Kahvaltıları Karşılaştır',
              ),
              SizedBox(width: 16.0),
              IconButton(
                onPressed: () {
                  GoRouter.of(context).go('/anayemek');
                },
                icon: Icon(Icons.restaurant_menu),
                tooltip: 'Ana Yemekleri Karşılaştır',
              ),
              SizedBox(width: 16.0),
              IconButton(
                onPressed: () {
                  GoRouter.of(context).go('/salata');
                },
                icon: Icon(Icons.local_florist),
                tooltip: 'Salataları Karşılaştır',
              ),
              SizedBox(width: 16.0),
              IconButton(
                onPressed: () {
                  GoRouter.of(context).go('/tatli');
                },
                icon: Icon(Icons.cake),
                tooltip: 'Tatlıları Karşılaştır',
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              _buildRestaurantButton('sutis_logo.png', '/sutis'),
              SizedBox(height: 20),
              _buildRestaurantButton('beyazfirin_logo.png', '/beyazfirin'),
              SizedBox(height: 20),
              _buildRestaurantButton('bigchef_logo.png', '/bigchefs'),
              Divider(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantButton(String imagePath, String route) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: () {
        GoRouter.of(context).go(route);
      },
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white, // Arka plan rengini beyaz yap
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: AssetImage('assets/images/$imagePath'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: 190,
          height: 190,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
