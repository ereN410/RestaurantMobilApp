import 'package:flutter/material.dart';
import 'package:flutter_advanced_dev/bloc/client/client_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/cart/cart_cubit.dart';
import '../../bloc/products/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/localizations.dart';

class TatliScreen extends StatefulWidget {
  const TatliScreen({Key? key}) : super(key: key);

  @override
  State<TatliScreen> createState() => _TatliScreenState();
}

class _TatliScreenState extends State<TatliScreen> {
  var products = [
    {
      "id": 1,
      "restorantid": "BigChefs",
      "name": "Findik Kremali Profiterol",
      "price": 105.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/ZVcj39h/B-g-Chefs-F-nd-kl-Kremal.png"
    },
    {
      "id": 2,
      "restorantid": "BigChefs",
      "name": "Baklavali Çitir Sufle",
      "price": 140.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/0jZKwHd/B-g-Chefs-Baklaval-t-r-Sufle.png"
    },
    {
      "id": 3,
      "restorantid": "BigChefs",
      "name": "San Sebastian Cheesecake",
      "price": 120.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/bPDfLBQ/B-g-Chefs-Cheescake.png"
    },
    {
      "id": 4,
      "restorantid": "BigChefs",
      "name": "Balkabakli Cheesecake",
      "price": 150.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/ynKgSgZ/B-g-Chefs-Balkabakl-Cheescake.png"
    },
    {
      "id": 5,
      "restorantid": "BeyazFırın",
      "name": "Çilekli Milföy",
      "price": 100.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/x3ffKv8/ilekli-milf-yt.png"
    },
    {
      "id": 6,
      "restorantid": "BeyazFırın",
      "name": "Beyaz Çikolatali Brownie",
      "price": 110.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/TYKcWfb/brownie.png"
    },
    {
      "id": 7,
      "restorantid": "BeyazFırın",
      "name": "Tiramisu",
      "price": 100.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/nPhHYR3/tiramisu.png"
    },
    {
      "id": 8,
      "restorantid": "BeyazFırın",
      "name": "Makaron Tabagi",
      "price": 150.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/sgV2TMF/makaron.png"
    },
    {
      "id": 9,
      "restorantid": "Sütiş",
      "name": "Profiterol",
      "price": 110.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/ZVcj39h/B-g-Chefs-F-nd-kl-Kremal.png"
    },
    {
      "id": 10,
      "restorantid": "Sütiş",
      "name": "Beyaz Çikolatali Brownie",
      "price": 120.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/WcrfTCj/brownie.png"
    },
    {
      "id": 11,
      "restorantid": "Sütiş",
      "name": "Tiramisu",
      "price": 110.00,
      "category": "Tatlilar",
      "photo": "https://i.ibb.co/QdxBTFT/tiramisu.png"
    },
    {
      "id": 12,
      "restorantid": "Sütiş",
      "name": "Fistikli Baklava",
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
