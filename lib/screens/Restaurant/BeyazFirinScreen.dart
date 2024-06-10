import 'package:flutter/material.dart';
import 'package:flutter_advanced_dev/bloc/client/client_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/cart/cart_cubit.dart';
import '../../bloc/products/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/localizations.dart';

class BeyazFirinScreen extends StatefulWidget {
  const BeyazFirinScreen({Key? key}) : super(key: key);

  @override
  State<BeyazFirinScreen> createState() => _BeyazFirinScreenState();
}

class _BeyazFirinScreenState extends State<BeyazFirinScreen> {
  var products = [
    {
      "id": 1,
      "name": "Kahvaltı Tabagi",
      "menucontent":
          "Kahvalti çesitleri ile birlikte 2 kisilik kahvalti tabagi ve 2 bardak çay ile birlikte",
      "price": 250.00,
      "category": "Kahvaltı",
      "photo": "https://i.ibb.co/kBv5yG2/kahvalt-taba.png"
    },
    {
      "id": 2,
      "name": "Menemen",
      "menucontent": "Keçi Peynirli, Cevizli, Otlu / Beyaz Peynirli / Sucuklu",
      "price": 130.00,
      "category": "Kahvaltı",
      "photo": "https://i.ibb.co/dDNWSNn/menemen-taba.png"
    },
    {
      "id": 3,
      "name": "Çirpilmis Yumurta",
      "price": 110.00,
      "category": "Kahvaltı",
      "photo": "https://i.ibb.co/zfGsGgQ/rp-lm-yumurta.png"
    },
    {
      "id": 4,
      "name": "Hindi Fümeli Sandviç",
      "price": 135.00,
      "category": "Kahvaltı",
      "photo": "https://i.ibb.co/jW263Tx/hindi-f-meli-sandvi.png"
    },
    {
      "id": 5,
      "name": "Günün Çorbasi",
      "price": 65.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/k46nCx9/g-n-n-orbas.png"
    },
    {
      "id": 6,
      "name": "Dolu Dolu Tabak",
      "price": 130.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/QmgY8m6/dolu-dolu-tabak.png"
    },
    {
      "id": 7,
      "name": "Pideli Yogurtlu Mini Köfte",
      "price": 100.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/Hnv1K44/mini-k-fte.png"
    },
    {
      "id": 8,
      "name": "Mini Çibörek",
      "price": 95.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/Bnd9BKH/mini-ib-rek.png"
    },
    {
      "id": 9,
      "name": "Cheeseburger",
      "price": 245.00,
      "category": "Ana Yemekler",
      "photo": "https://i.ibb.co/1RW5jcm/burger.png"
    },
    {
      "id": 10,
      "name": "Izgara Köfte",
      "price": 245.00,
      "category": "Ana Yemekler",
      "photo": "https://i.ibb.co/QdCvLh4/zgarak-fte.png"
    },
    {
      "id": 11,
      "name": "Tavuklu Mantarli Alfredo",
      "price": 190.00,
      "category": "Ana Yemekler",
      "photo": "https://i.ibb.co/648X5tJ/fettucinoalfredo.png"
    },
    {
      "id": 12,
      "name": "Margerita Pizza",
      "price": 190.00,
      "category": "Ana Yemekler",
      "photo": "https://i.ibb.co/JR6MJFN/margerita-pizza.png"
    },
    {
      "id": 13,
      "name": "Zencefil Soslu Tavuk Salata",
      "price": 65.00,
      "category": "Salatalar",
      "photo": "https://i.ibb.co/0QhpNrf/zencefil-soslu-salata.png"
    },
    {
      "id": 14,
      "name": "Burrata Peynirli Salata",
      "price": 130.00,
      "category": "Salatalar",
      "photo": "https://i.ibb.co/j4Y8j6T/burrata.png"
    },
    {
      "id": 15,
      "name": "Izgara Tavuk Salata",
      "price": 100.00,
      "category": "Salatalar",
      "photo": "https://i.ibb.co/R4sf06P/zgara-tavuklu-salata.png"
    },
    {
      "id": 16,
      "name": "Avokadolu ve Peynirli Salata",
      "price": 95.00,
      "category": "Salatalar",
      "photo": "https://i.ibb.co/RPjvLWb/avakadolu-salata.png"
    },
    {
      "id": 17,
      "name": "Çilekli Milföy",
      "price": 100.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/x3ffKv8/ilekli-milf-yt.png"
    },
    {
      "id": 18,
      "name": "Beyaz Çikolatalı Brownie",
      "price": 110.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/TYKcWfb/brownie.png"
    },
    {
      "id": 19,
      "name": "Tiramisu",
      "price": 100.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/nPhHYR3/tiramisu.png"
    },
    {
      "id": 20,
      "name": "Makaron Tabagi",
      "price": 150.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/sgV2TMF/makaron.png"
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
                        Text(
                          products[index]["name"].toString(),
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
