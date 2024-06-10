import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class KategoriScreen extends StatelessWidget {
  const KategoriScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategoriler'),
      ),
      body: KategoriListe(),
    );
  }
}

class KategoriListe extends StatelessWidget {
  final List<String> kategoriler = [
    'Başlangıçlar',
    'Kahvaltılar',
    'Ana Yemek',
    'Salata',
    'Tatlı',
  ];

  final Map<String, String> kategoriYollari = {
    'Başlangıçlar': '/baslangic',
    'Kahvaltılar': '/kahvalti',
    'Ana Yemek': '/anayemek',
    'Salata': '/salata',
    'Tatlı': '/tatli',
  };

  void kategoriyeGit(BuildContext context, String kategoriAdi) {
    final String yol = kategoriYollari[kategoriAdi] ?? '/';
    context.go(yol);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kategoriler.length,
      itemBuilder: (context, index) {
        final kategori = kategoriler[index];
        return ListTile(
          title: Text(kategori),
          onTap: () {
            kategoriyeGit(context, kategori);
          },
        );
      },
    );
  }
}
