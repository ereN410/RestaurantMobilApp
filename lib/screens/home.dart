import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/cart/cart_cubit.dart';
import '../bloc/client/client_cubit.dart';
import '../core/localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ClientCubit clientCubit;
  late CartCubit cartCubit;
  TextEditingController ilKoduYoneticisi = TextEditingController(text: "34");
  late ImagePicker _imagePicker;
  File? _selectedImageFile;

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
    cartCubit = context.read<CartCubit>();
    ilKodlariniOku();
    _imagePicker = ImagePicker();
  }

  Map<String, dynamic> states = {};

  ilKodlariniOku() async {
    String iller = await rootBundle.loadString('assets/json/states.json');

    Map<String, dynamic> json = jsonDecode(iller);

    setState(() {
      states = json;
    });

    print(json);
  }

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImageFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(builder: (context, state) {
      return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withAlpha(150),
                          width: 3,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://www.rollingstone.com/wp-content/uploads/2023/02/elon-twitter-new-ceo.jpg?w=1581&h=1054&crop=1",
                        ),
                        maxRadius: 42,
                      ),
                    ),
                    const Gap(20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Eren ve Tunahan",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "Kullanici",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withAlpha(150)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: const Text('Home'),
                selected: true,
                // enabled: false,
                onTap: () => context.push("/restaurant"),
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                ),
                title: const Text('Hakkımızda'),
                selected: true,
                // enabled: false,
                onTap: () => context.push("/about"),
              ),
              ListTile(
                leading: const Icon(
                  Icons.menu_book,
                ),
                title: const Text('Kategoriler'),
                selected: true,
                // enabled: false,
                onTap: () => context.push("/kategori"),
              ),
              ListTile(
                leading: const Icon(
                  Icons.storefront,
                ),
                title: const Text('Markalar'),
                onTap: () => context.push("/brands"),
              ),
              ListTile(
                leading: const Icon(
                  Icons.call,
                ),
                title: const Text('İletişim'),
                onTap: () => context.push("/contact"),
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                ),
                title: const Text('Ayarlar'),
                onTap: () => context.push("/home"),
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                ),
                title: const Text('Logout'),
                onTap: () => context.push("/login"),
              ),
              const Divider(),
              SwitchListTile(
                value: clientCubit.state.darkMode,
                onChanged: (value) {
                  clientCubit.changeDarkMode(darkMode: value);
                },
                secondary: clientCubit.state.darkMode
                    ? const Icon(Icons.sunny)
                    : const Icon(Icons.nightlight),
                title: const Text('Gece Modu'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).getTranslate("home_title")),
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
          ],
        ),
        body: SafeArea(
          child: SizedBox.expand(
            child: ListView(
              children: [
                InkWell(
                    onTap: () => GoRouter.of(context).push("/restaurant"),
                    child: const Text("HomeScreen")),
                Text("Language: " + clientCubit.state.language),
                Text("DarkMode: " + clientCubit.state.darkMode.toString()),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: clientCubit.state.language == "en"
                            ? null
                            : () {
                                clientCubit.changeLanguage(language: "en");
                              },
                        child: Text("English")),
                    Gap(10),
                    ElevatedButton(
                        onPressed: clientCubit.state.language == "tr"
                            ? null
                            : () {
                                clientCubit.changeLanguage(language: "tr");
                              },
                        child: Text("Turkce")),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push("/products");
                    },
                    child: Text(
                      AppLocalizations.of(context).getTranslate("products"),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(200, 50),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Divider(
                  thickness: 2,
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push("/payment");
                    },
                    child: const Text("Odeme"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(200, 50),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Divider(
                  thickness: 2,
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push("/settings");
                    },
                    child: Text(
                      AppLocalizations.of(context).getTranslate("settings"),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Köşeleri bombeli yapar
                      ),
                      minimumSize: Size(
                          200, 50), // Minimum genişlik ve yükseklik belirler
                    ),
                  ),
                ),
                const SizedBox(height: 50), // En altta 50 birim boşluk ekler
                OutlinedButton(
                    onPressed: () => context.push("/preview"),
                    child: const Text("Temalandirma")),
                const Gap(10),
                OutlinedButton(
                    onPressed: () => context.push("/ip"),
                    child: const Text("IP 2 Location")),
                const Gap(10),
                OutlinedButton(
                    onPressed: () => context.push("/translate"),
                    child: const Text("Dictionary API")),
                const Gap(10),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          // height: 200,
                          // color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Gap(40),
                              Text(
                                'This is a BottomSheet',
                                style: TextStyle(fontSize: 20),
                              ),
                              SwitchListTile(
                                value: clientCubit.state.darkMode,
                                onChanged: (value) {
                                  clientCubit.changeDarkMode(darkMode: value);
                                },
                                secondary: clientCubit.state.darkMode
                                    ? const Icon(Icons.sunny)
                                    : const Icon(Icons.nightlight),
                                title: const Text('Gece Modu'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close BottomSheet'),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      clientCubit.changeLanguage(
                                          language: "en");
                                    },
                                    child: Text('English'),
                                  ),
                                  Gap(10),
                                  ElevatedButton(
                                    onPressed: () {
                                      clientCubit.changeLanguage(
                                          language: "tr");
                                    },
                                    child: Text('Türkçe'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Text("Temel Ayarlar"),
                ),
                const Gap(10),
                OutlinedButton(
                  onPressed: () {
                    context.push("/brands");
                  },
                  child: const Text("Markalar"),
                ),
                const Gap(10),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => ListView(
                        padding: const EdgeInsets.symmetric(vertical: 35),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              AppLocalizations.of(context)
                                  .getTranslate("select-language"),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Gap(20),
                          ListTile(
                              title: const Text("Turkce"),
                              leading: const Icon(Icons.language),
                              enabled: clientCubit.state.language != "tr",
                              subtitle: const Text("Turkish (Turkiye)"),
                              onTap: () =>
                                  clientCubit.changeLanguage(language: "tr")),
                          ListTile(
                            title: const Text("English"),
                            enabled: clientCubit.state.language != "en",
                            leading: const Icon(Icons.language),
                            subtitle: const Text("English (United States)"),
                            onTap: () =>
                                clientCubit.changeLanguage(language: "en"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text("Dil Secimi"),
                ),
                const SizedBox(height: 50),
                const Text("Eren GÜNAL & Tunahan ÇAĞLAYAN"),
                TextField(
                  controller: ilKoduYoneticisi,
                ),
                const Gap(10),
                OutlinedButton(
                  onPressed: () {
                    if (states.containsKey(ilKoduYoneticisi.text)) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Text(states[ilKoduYoneticisi.text]),
                              ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Text("Bulunamadi"),
                              ));
                    }
                  },
                  child: const Text("Ara"),
                ),
                IconButton(
                  onPressed: _pickImage,
                  icon: Icon(Icons.add_photo_alternate),
                  tooltip: 'Resim Ekle',
                ),
                const SizedBox(height: 20.0),
                if (_selectedImageFile != null)
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: FileImage(_selectedImageFile!),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
