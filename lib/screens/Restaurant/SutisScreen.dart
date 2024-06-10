import 'package:flutter/material.dart';
import 'package:flutter_advanced_dev/bloc/client/client_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/cart/cart_cubit.dart';
import '../../bloc/products/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/localizations.dart';

class SutisScreen extends StatefulWidget {
  const SutisScreen({Key? key}) : super(key: key);

  @override
  State<SutisScreen> createState() => _SutisScreenState();
}

class _SutisScreenState extends State<SutisScreen> {
  var products = [
    {
      "id": 1,
      "name": "Sarküteri Tabagi",
      "price": 280.00,
      "category": "Kahvalti",
      "photo": "https://i.ibb.co/Q8182YW/ark-teri-taba.png"
    },
    {
      "id": 2,
      "name": "Menemen",
      "price": 105.00,
      "category": "Kahvalti",
      "photo": "https://i.ibb.co/YpYLDbJ/menemen.png"
    },
    {
      "id": 3,
      "name": "Sahanda Yumurta",
      "price": 110.00,
      "category": "Kahvalti",
      "photo": "https://i.ibb.co/9tHSQRW/sahanda-yumurta.png"
    },
    {
      "id": 4,
      "name": "Sarküterili Sandviç",
      "price": 125.00,
      "category": "Kahvalti",
      "photo": "https://i.ibb.co/c6yzHx0/ark-teri-sandvi.png"
    },
    {
      "id": 5,
      "name": "Tavuk Etli Çorba",
      "price": 55.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/VSmh1Lm/Tavuk-etli-orba.png"
    },
    {
      "id": 6,
      "name": "Sögüs Tabagi",
      "price": 75.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/7NdWn6q/s.png"
    },
    {
      "id": 7,
      "name": "Patates Tava",
      "price": 70.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/MNd0K5v/B-g-Chefs-Patates-Tava.png"
    },
    {
      "id": 8,
      "name": "Mozzarella Domates",
      "price": 85.00,
      "category": "Baslangiçlar",
      "photo": "https://i.ibb.co/0F16sdD/mozeralla-domates.png"
    },
    {
      "id": 9,
      "name": "Cheeseburger",
      "price": 255.00,
      "category": "Ana Yemekler",
      "photo": "https://i.ibb.co/zfZY25t/burger.png"
    },
    {
      "id": 10,
      "name": "Fettuccine Alfredo",
      "price": 175.00,
      "category": "Ana Yemekler",
      "photo": "https://i.ibb.co/Gt7vtWS/fettucino.png"
    },
    {
      "id": 11,
      "name": "Köfte",
      "price": 270.00,
      "category": "Ana Yemekler",
      "photo": "https://i.ibb.co/rM04wnC/k-fte.png"
    },
    {
      "id": 12,
      "name": "Bonfile",
      "price": 485.00,
      "category": "Ana Yemekler",
      "photo": "https://i.ibb.co/2FpX0YZ/bonfile.png"
    },
    {
      "id": 13,
      "name": "Ton Balikli Salata",
      "price": 80.00,
      "category": "Salatalar",
      "photo": "https://i.ibb.co/D78ztdt/tabuklu-salata.png"
    },
    {
      "id": 14,
      "name": "Mozzarella Salatasi",
      "price": 90.00,
      "category": "Salatalar",
      "photo": "https://i.ibb.co/kKg54bF/B-g-Chefs-Panzenalla.png"
    },
    {
      "id": 15,
      "name": "Akdeniz Salata",
      "price": 65.00,
      "category": "Salatalar",
      "photo": "https://i.ibb.co/hLP4RVb/akdeniz.png"
    },
    {
      "id": 16,
      "name": "Sezar Salata",
      "price": 85.00,
      "category": "Salatalar",
      "photo": "https://i.ibb.co/0Mqy9Xx/sezar-salata.png"
    },
    {
      "id": 17,
      "name": "Profiterol",
      "price": 110.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/ZVcj39h/B-g-Chefs-F-nd-kl-Kremal.png"
    },
    {
      "id": 18,
      "name": "Beyaz Çikolatalı Brownie",
      "price": 120.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/WcrfTCj/brownie.png"
    },
    {
      "id": 19,
      "name": "Tiramisu",
      "price": 110.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/QdxBTFT/tiramisu.png"
    },
    {
      "id": 20,
      "name": "Fıstıklı Baklava",
      "price": 130.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/Sfh9TD0/f-st-kl-baklava.png"
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
