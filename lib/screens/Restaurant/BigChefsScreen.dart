import 'package:flutter/material.dart';
import 'package:flutter_advanced_dev/bloc/client/client_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart'; // image_picker paketini ekledik
import 'dart:typed_data'; // Uint8List için ekledik
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart'; // SharedPreferences ekledik
import '../../bloc/cart/cart_cubit.dart';
import '../../bloc/products/products_cubit.dart';
import '../../core/localizations.dart';

class BigChefsScreen extends StatefulWidget {
  const BigChefsScreen({Key? key}) : super(key: key);

  @override
  State<BigChefsScreen> createState() => _BigChefsScreenState();
}

class _BigChefsScreenState extends State<BigChefsScreen> {
  var products = [
    {
      "id": 1,
      "name": "Serpme Kahvaltı",
      "category": "Kahvaltı",
      "in-stock": true,
      "price": 240.00,
      "photo": "https://i.ibb.co/34Y3BZw/B-g-Chefs-Serpme-Kahvalt.png",
    },
    {
      "id": 2,
      "name": "Menemen",
      "category": "Kahvaltı",
      "in-stock": true,
      "price": 115.00,
      "photo": "https://i.ibb.co/YpYLDbJ/menemen.png",
    },
    {
      "id": 3,
      "name": "Sahanda Yumurta",
      "category": "Kahvaltı",
      "in-stock": true,
      "price": 90.00,
      "photo": "https://i.ibb.co/x6VhKC5/B-g-Chefs-Sahanda-Yumurta.png",
    },
    {
      "id": 4,
      "name": "Pancake",
      "category": "Kahvaltı",
      "in-stock": true,
      "price": 150.00,
      "photo": "https://i.ibb.co/M63Fh0d/B-g-Chefs-Pancake.png",
    },
    {
      "id": 5,
      "name": "Asure Çorbası",
      "category": "Ara Sıcak",
      "in-stock": true,
      "price": 70.00,
      "photo": "https://i.ibb.co/Pw0xCWh/B-g-Chefs-A-ure-orbas.png",
    },
    {
      "id": 6,
      "name": "Çıtır Mantı",
      "category": "Ara Sıcak",
      "in-stock": true,
      "price": 115.00,
      "photo": "https://i.ibb.co/brBb7t0/B-g-Chefs-t-r-Mant.png",
    },
    {
      "id": 7,
      "name": "Patates Tava",
      "category": "Baslangıçlar",
      "in-stock": true,
      "price": 85.00,
      "photo": "https://i.ibb.co/MNd0K5v/B-g-Chefs-Patates-Tava.png",
    },
    {
      "id": 8,
      "name": "Peri Soslu Patlican ve Humus",
      "category": "Baslangıçlar",
      "in-stock": true,
      "price": 120.00,
      "photo": "https://i.ibb.co/jWPbxG6/B-g-Chefs-Humus.png",
    },
    {
      "id": 9,
      "name": "Big Burger",
      "category": "Ana Yemekler",
      "in-stock": true,
      "price": 270.00,
      "photo": "https://i.ibb.co/wdkB7cY/B-g-Chefs-Big-Burger.png",
    },
    {
      "id": 10,
      "name": "Fettuccine Alfredo",
      "category": "Ana Yemekler",
      "in-stock": true,
      "price": 155.00,
      "photo": "https://i.ibb.co/hR014gQ/B-g-Chefs-Big-Fetticino-Alfredo.png",
    },
    {
      "id": 11,
      "name": "Izgara Bonfile Dilimleri",
      "category": "Ana Yemekler",
      "in-stock": true,
      "price": 385.00,
      "photo": "https://i.ibb.co/WHTT2JC/B-g-Chefs-Izgara-Bonfile.png",
    },
    {
      "id": 12,
      "name": "Margarita Pizza",
      "category": "Ana Yemekler",
      "in-stock": true,
      "price": 220.00,
      "photo": "https://i.ibb.co/61WdNq2/B-g-Chefs-Margarita.png",
    },
    {
      "id": 13,
      "name": "Çok Tahıllı Salata",
      "price": 70.00,
      "category": "Salatalar",
      "photo": "https://i.ibb.co/6BdtYhP/B-g-Chefs-ok-Tah-ll.png"
    },
    {
      "id": 14,
      "name": "Bahçe Salatası",
      "price": 115.00,
      "category": "Salatalar",
      "photo": "https://i.ibb.co/mqGDx8L/B-g-Chefs-Bah-e-Salatas.png"
    },
    {
      "id": 15,
      "name": "Panzenella Salata",
      "price": 85.00,
      "category": "Salatalar",
      "photo": "https://i.ibb.co/kKg54bF/B-g-Chefs-Panzenalla.png"
    },
    {
      "id": 16,
      "name": "Sezar Salata",
      "price": 120.00,
      "category": "Salatalar",
      "photo": "https://i.ibb.co/sW0Q6VY/B-g-Chefs-Sezar.png"
    },
    {
      "id": 17,
      "name": "Fındık Kremalı Profiterol",
      "price": 105.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/ZVcj39h/B-g-Chefs-F-nd-kl-Kremal.png"
    },
    {
      "id": 18,
      "name": "Baklavalı Çıtır Sufle",
      "price": 140.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/0jZKwHd/B-g-Chefs-Baklaval-t-r-Sufle.png"
    },
    {
      "id": 19,
      "name": "San Sebastian Cheesecake",
      "price": 120.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/bPDfLBQ/B-g-Chefs-Cheescake.png"
    },
    {
      "id": 20,
      "name": "Balkabağlı Cheesecake",
      "price": 150.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/ynKgSgZ/B-g-Chefs-Balkabakl-Cheescake.png"
    }
  ];

  late ProductsCubit productsCubit;
  late CartCubit cartCubit;
  late ClientCubit clientCubit;

  Uint8List? _imageData;

  @override
  void initState() {
    super.initState();
    productsCubit = context.read<ProductsCubit>();
    cartCubit = context.read<CartCubit>();
    clientCubit = context.read<ClientCubit>();
    _loadImageData(); // Uygulama başlatıldığında _imageData'yı yükle
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      // SharedPreferences ile _imageData'yı kaydet
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('imageData', String.fromCharCodes(bytes));

      setState(() {
        _imageData = bytes;
      });
    }
  }

  Future<void> _loadImageData() async {
    final prefs = await SharedPreferences.getInstance();
    final imageData = prefs.getString('imageData');
    if (imageData != null) {
      // String'den Uint8List'e dönüştürme
      setState(() {
        _imageData = Uint8List.fromList(imageData.codeUnits);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).getTranslate("products")),
        actions: [
          if (clientCubit.state.darkMode)
            IconButton(
              onPressed: () {
                clientCubit.changeDarkMode(darkMode: false);
              },
              icon: Icon(Icons.sunny),
            )
          else
            IconButton(
              onPressed: () => GoRouter.of(context).push("/restaurant"),
              icon: Icon(Icons.arrow_back_ios),
            ),
          IconButton(
            onPressed: () {
              clientCubit.changeDarkMode(darkMode: true);
            },
            icon: Icon(Icons.nightlight),
          ),
          IconButton(
            onPressed: () {
              if (clientCubit.state.language == "tr") {
                clientCubit.changeLanguage(language: "en");
              } else {
                clientCubit.changeLanguage(language: "tr");
              }
            },
            icon: Icon(Icons.language),
          ),
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
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        Theme.of(context).colorScheme.secondary.withAlpha(50),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.network(
                        products[index]["photo"].toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(products[index]["name"].toString(),
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold)),
                        IconButton(
                          onPressed: () {
                            if (productsCubit
                                .isFavorite(products[index]["id"] as int)) {
                              productsCubit.removeFromFavorites(
                                  products[index]["id"] as int);
                            } else {
                              productsCubit.addToFavorites(products[index]);
                            }
                          },
                          icon: productsCubit
                                  .isFavorite(products[index]["id"] as int)
                              ? Icon(Icons.favorite, color: Colors.red)
                              : Icon(Icons.favorite_border),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      products[index]["category"].toString(),
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "${products[index]["price"]} ₺",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        cartCubit.sepeteEkle(
                          id: products[index]["id"] as int,
                          photo: products[index]["photo"].toString(),
                          ad: products[index]["name"].toString(),
                          sayi: 1,
                          fiyat: products[index]["price"] as double,
                        );

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(AppLocalizations.of(context)
                                .getTranslate("cart")),
                            content: Text(AppLocalizations.of(context)
                                .getTranslate("added-to-cart")),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () =>
                                        GoRouter.of(context).push("/cart"),
                                    child: Text("Sepete Git"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => GoRouter.of(context).pop(),
                                    child: Text("Kapat"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(AppLocalizations.of(context)
                          .getTranslate("add_to_basket")),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Yeni eklenen buton
          Container(
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
                SizedBox(width: 16.0),
                IconButton(
                  onPressed: _pickImage,
                  icon: Icon(Icons.photo_library),
                  tooltip: 'Galeriden Fotoğraf Yükle',
                ),
              ],
            ),
          ),
          if (_imageData != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.memory(
                _imageData!,
                height: 200,
                width: 200,
              ),
            ),
        ],
      ),
    );
  }
}
