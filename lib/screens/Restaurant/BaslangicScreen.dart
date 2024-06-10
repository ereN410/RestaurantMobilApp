import 'package:flutter/material.dart';
import 'package:flutter_advanced_dev/bloc/client/client_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/cart/cart_cubit.dart';
import '../../bloc/products/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/localizations.dart';

class BaslangicScreen extends StatefulWidget {
  const BaslangicScreen({Key? key}) : super(key: key);

  @override
  State<BaslangicScreen> createState() => _BaslangicScreenState();
}

class _BaslangicScreenState extends State<BaslangicScreen> {
  var products = [
    {
      "id": 1,
      "restorantid": "BigChefs",
      "name": "Asure Çorbasi",
      "price": 70.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/Pw0xCWh/B-g-Chefs-A-ure-orbas.png"
    },
    {
      "id": 2,
      "restorantid": "BigChefs",
      "name": "Çitir Manti",
      "price": 115.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/brBb7t0/B-g-Chefs-t-r-Mant.png"
    },
    {
      "id": 3,
      "restorantid": "BigChefs",
      "name": "Patates Tava",
      "price": 85.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/MNd0K5v/B-g-Chefs-Patates-Tava.png"
    },
    {
      "id": 4,
      "restorantid": "BigChefs",
      "name": "Peri Soslu Patlican ve Humus",
      "price": 120.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/jWPbxG6/B-g-Chefs-Humus.png"
    },
    {
      "id": 5,
      "restorantid": "BeyazFırın",
      "name": "Günün Çorbasi",
      "price": 65.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/k46nCx9/g-n-n-orbas.png"
    },
    {
      "id": 6,
      "restorantid": "BeyazFırın",
      "name": "Dolu Dolu Tabak",
      "price": 130.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/QmgY8m6/dolu-dolu-tabak.png"
    },
    {
      "id": 7,
      "restorantid": "BeyazFırın",
      "name": "Pideli Yogurtlu Mini Köfte",
      "price": 100.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/Hnv1K44/mini-k-fte.png"
    },
    {
      "id": 8,
      "restorantid": "BeyazFırın",
      "name": "Mini Çibörek",
      "price": 95.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/Bnd9BKH/mini-ib-rek.png"
    },
    {
      "id": 9,
      "restorantid": "Sütiş",
      "name": "Tavuk Etli Çorba",
      "price": 55.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/VSmh1Lm/Tavuk-etli-orba.png"
    },
    {
      "id": 10,
      "restorantid": "Sütiş",
      "name": "Sögüs Tabagi",
      "price": 75.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/7NdWn6q/s.png"
    },
    {
      "id": 11,
      "restorantid": "Sütiş",
      "name": "Patates Tava",
      "price": 70.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/MNd0K5v/B-g-Chefs-Patates-Tava.png"
    },
    {
      "id": 12,
      "restorantid": "Sütiş",
      "name": "Mozzarella Domates",
      "price": 85.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/0F16sdD/mozeralla-domates.png"
    }
  ];

  late ProductsCubit productsCubit;
  late CartCubit cartCubit;
  late ClientCubit clientCubit;

  @override
  void initState() {
    super.initState();
    productsCubit = context.read<ProductsCubit>();
    cartCubit = context.read<CartCubit>();
    clientCubit = context.read<ClientCubit>();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // İki ürün yan yana gösterilecek
                crossAxisSpacing: 16.0, // Yatay aralık
                mainAxisSpacing: 16.0, // Dikey aralık
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
                        Expanded(
                          child: Text(
                            products[index]["name"].toString(),
                            maxLines: 2, // Maksimum 2 satıra kadar sığacak
                            overflow: TextOverflow
                                .ellipsis, // Taşan kısımları ... ile göster
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
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
                          //restorantId: products[index]["restorantid"].toString(),
                        );

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              AppLocalizations.of(context).getTranslate("cart"),
                            ),
                            content: Text(
                              AppLocalizations.of(context)
                                  .getTranslate("added-to-cart"),
                            ),
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
                      child: Text(
                        AppLocalizations.of(context)
                            .getTranslate("add_to_basket"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
