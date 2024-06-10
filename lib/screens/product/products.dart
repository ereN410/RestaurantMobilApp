import 'package:flutter/material.dart';
import 'package:flutter_advanced_dev/bloc/client/client_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/cart/cart_cubit.dart';
import '../../bloc/products/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/localizations.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var products = [
    {
      "id": 1,
      "name": "Kahvaltı Tabagi",
      "price": 250.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/kBv5yG2/kahvalt-taba.png"
    },
    {
      "id": 2,
      "name": "Menemen",
      "price": 130.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/dDNWSNn/menemen-taba.png"
    },
    {
      "id": 3,
      "name": "Çirpilmis Yumurta",
      "price": 110.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/zfGsGgQ/rp-lm-yumurta.png"
    },
    {
      "id": 4,
      "name": "Hindi Fümeli Sandviç",
      "price": 135.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/jW263Tx/hindi-f-meli-sandvi.png"
    },
    {
      "id": 5,
      "name": "Günün Çorbasi",
      "price": 65.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/k46nCx9/g-n-n-orbas.png"
    },
    {
      "id": 6,
      "name": "Dolu Dolu Tabak",
      "price": 130.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/QmgY8m6/dolu-dolu-tabak.png"
    },
    {
      "id": 7,
      "name": "Pideli Yogurtlu Mini Köfte",
      "price": 100.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/Hnv1K44/mini-k-fte.png"
    },
    {
      "id": 8,
      "name": "Mini Çibörek",
      "price": 95.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/Bnd9BKH/mini-ib-rek.png"
    },
    {
      "id": 9,
      "name": "Cheeseburger",
      "price": 245.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/1RW5jcm/burger.png"
    },
    {
      "id": 10,
      "name": "Izgara Köfte",
      "price": 245.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/QdCvLh4/zgarak-fte.png"
    },
    {
      "id": 11,
      "name": "Tavuklu Mantarli Alfredo",
      "price": 190.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/648X5tJ/fettucinoalfredo.png"
    },
    {
      "id": 12,
      "name": "Margerita Pizza",
      "price": 190.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/JR6MJFN/margerita-pizza.png"
    },
    {
      "id": 13,
      "name": "Zencefil Soslu Tavuk Salata",
      "price": 65.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/0QhpNrf/zencefil-soslu-salata.png"
    },
    {
      "id": 14,
      "name": "Burrata Peynirli Salata",
      "price": 130.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/j4Y8j6T/burrata.png"
    },
    {
      "id": 15,
      "name": "Izgara Tavuk Salata",
      "price": 100.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/R4sf06P/zgara-tavuklu-salata.png"
    },
    {
      "id": 16,
      "name": "Avokadolu ve Peynirli Salata",
      "price": 95.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/RPjvLWb/avakadolu-salata.png"
    },
    {
      "id": 17,
      "name": "Çilekli Milföy",
      "price": 100.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/x3ffKv8/ilekli-milf-yt.png"
    },
    {
      "id": 18,
      "name": "Beyaz Çikolatalı Brownie",
      "price": 110.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/TYKcWfb/brownie.png"
    },
    {
      "id": 19,
      "name": "Tiramisu",
      "price": 100.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/nPhHYR3/tiramisu.png"
    },
    {
      "id": 20,
      "name": "Makaron Tabagi",
      "price": 150.00,
      "in-stock": true,
      "photo": "https://i.ibb.co/sgV2TMF/makaron.png"
    },
    {
      "id": 21,
      "name": "Serpme Kahvaltı",
      "in-stock": true,
      "price": 240.00,
      "photo": "https://i.ibb.co/34Y3BZw/B-g-Chefs-Serpme-Kahvalt.png",
    },
    {
      "id": 22,
      "name": "Menemen",
      "in-stock": true,
      "price": 115.00,
      "photo": "https://i.ibb.co/YpYLDbJ/menemen.png",
    },
    {
      "id": 23,
      "name": "Sahanda Yumurta",
      "in-stock": true,
      "price": 90.00,
      "photo": "https://i.ibb.co/x6VhKC5/B-g-Chefs-Sahanda-Yumurta.png",
    },
    {
      "id": 24,
      "name": "Pancake",
      "in-stock": true,
      "price": 150.00,
      "photo": "https://i.ibb.co/M63Fh0d/B-g-Chefs-Pancake.png",
    },
    {
      "id": 25,
      "name": "Asure Çorbası",
      "in-stock": true,
      "price": 70.00,
      "photo": "https://i.ibb.co/Pw0xCWh/B-g-Chefs-A-ure-orbas.png",
    },
    {
      "id": 26,
      "name": "Çıtır Mantı",
      "in-stock": true,
      "price": 115.00,
      "photo": "https://i.ibb.co/brBb7t0/B-g-Chefs-t-r-Mant.png",
    },
    {
      "id": 27,
      "name": "Patates Tava",
      "in-stock": true,
      "price": 85.00,
      "photo": "https://i.ibb.co/MNd0K5v/B-g-Chefs-Patates-Tava.png",
    },
    {
      "id": 28,
      "name": "Peri Soslu Patlican ve Humus",
      "in-stock": true,
      "price": 120.00,
      "photo": "https://i.ibb.co/jWPbxG6/B-g-Chefs-Humus.png",
    },
    {
      "id": 29,
      "name": "Big Burger",
      "in-stock": true,
      "price": 270.00,
      "photo": "https://i.ibb.co/wdkB7cY/B-g-Chefs-Big-Burger.png",
    },
    {
      "id": 30,
      "name": "Fettuccine Alfredo",
      "in-stock": true,
      "price": 155.00,
      "photo": "https://i.ibb.co/hR014gQ/B-g-Chefs-Big-Fetticino-Alfredo.png",
    },
    {
      "id": 31,
      "name": "Izgara Bonfile Dilimleri",
      "in-stock": true,
      "price": 385.00,
      "photo": "https://i.ibb.co/WHTT2JC/B-g-Chefs-Izgara-Bonfile.png",
    },
    {
      "id": 32,
      "name": "Margarita Pizza",
      "in-stock": true,
      "price": 220.00,
      "photo": "https://i.ibb.co/61WdNq2/B-g-Chefs-Margarita.png",
    },
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
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    clientCubit.changeDarkMode(darkMode: false);
                  },
                  icon: Icon(Icons.sunny)),
            )
          else
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    clientCubit.changeDarkMode(darkMode: true);
                  },
                  icon: Icon(Icons.nightlight)),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: IconButton(
              onPressed: () {
                if (clientCubit.state.language == "tr") {
                  clientCubit.changeLanguage(language: "en");
                } else {
                  clientCubit.changeLanguage(language: "tr");
                }
              },
              icon: Icon(Icons.language),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: IconButton(
              onPressed: () => GoRouter.of(context).push("/favorites"),
              icon: Icon(Icons.favorite),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () => GoRouter.of(context).push("/cart"),
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body:
          BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
        return SizedBox.expand(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        Theme.of(context).colorScheme.secondary.withAlpha(50),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                margin: const EdgeInsets.all(14.0),
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Image.network(products[index]["photo"].toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(products[index]["name"].toString()),
                        if (productsCubit
                            .isFavorite(products[index]["id"] as int))
                          IconButton(
                              onPressed: () {
                                productsCubit.removeFromFavorites(
                                    products[index]["id"] as int);
                              },
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ))
                        else
                          IconButton(
                              onPressed: () {
                                productsCubit.addToFavorites(products[index]);
                              },
                              icon: const Icon(Icons.favorite_border))
                      ],
                    ),
                    if (products[index]["in-stock"] as bool)
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
                                      onPressed: () =>
                                          GoRouter.of(context).pop(),
                                      child: Text("X"),
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
                    if (products[index]["in-stock"] as bool)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.check_box),
                              Text(AppLocalizations.of(context)
                                  .getTranslate("in-stock")),
                            ],
                          ),
                          Text(products[index]["price"].toString() + " ₺"),
                        ],
                      )
                    else
                      Row(
                        children: [
                          const Icon(Icons.error),
                          Text(AppLocalizations.of(context)
                              .getTranslate("not-available")),
                        ],
                      ),
                    const Divider(),
                  ],
                )),
          ),
        );
      }),
    );
  }
}
