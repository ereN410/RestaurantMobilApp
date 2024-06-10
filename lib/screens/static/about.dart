import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hakkımızda'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/tunahan_caglayan.jpg'),
                    radius: 50.0,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/eren_gunal.jpg'),
                    radius: 50.0,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tunahan Çağlayan',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const Text('Bilgisayar Programcılığı 2. Sınıf Öğrencisi'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Eren Günal',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                          'Bilgisayar Programcılığı 2. Sınıf Öğrencisi & Tester'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Hakkımızda',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Merhaba! Biz Tunahan Çağlayan ve Eren Günal. Bilgisayar Programcılığı 2. sınıf öğrencisi olan bizler, bu alana yazılım ve yapay zekaya olan tutkumuzla adım attık.',
              ),
              const SizedBox(height: 10.0),
              const Text(
                '**Tunahan Çağlayan** olarak, kendimi yapay zeka, robotik ve kodlama gibi alanlarda geliştirmeyi hedefliyorum. Yazılım ve yapay zekaya duyduğum merak beni bu alana yönlendirdi ve bu alanda kendimi geliştirmeye devam edeceğim.',
              ),
              const SizedBox(height: 10.0),
              const Text(
                '**Eren Günal** ise aktif olarak bir yazılım test uzmanı olarak çalışırken aynı zamanda da Bilgisayar Programcılığı 2. sınıf öğrencisi. Uzun süredir yazılımla iç içe olan Eren, bu alandan büyük keyif alıyor ve bu alandaki bilgisini ve becerilerini geliştirmeye devam ediyor.',
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Birlikte, yazılım ve yapay zeka alanlarında kendimizi geliştirmeye ve bu alanlarda yeni şeyler üretmeye devam etmeyi hedefliyoruz.',
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
