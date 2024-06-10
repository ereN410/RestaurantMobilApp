// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/cache.dart';
import '../core/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Map<String, dynamic> pageConfig = {};
  bool configLoaded = false;

  loadData() async {
    // hafiza okuma
    // dil tema , ...
    CacheSystem cs = CacheSystem();
    final pageConfig = await cs.getSplashConfig();

    setState(() {
      this.pageConfig = pageConfig;
      configLoaded = true;
    });

    Future.delayed(Duration(milliseconds: pageConfig["duration"]), () {
      context.go("/home");
    });
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return !configLoaded
        ? const SizedBox()
        : Scaffold(
            body: SafeArea(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: pageConfig["backgroundColor"].isNotEmpty
                      ? HexColor(pageConfig["backgroundColor"])
                      : null,
                ),
                child: Stack(
                  children: [
                    if (pageConfig["background"].isNotEmpty)
                      SizedBox.expand(
                        child: Image.network(
                          pageConfig["background"],
                          fit: BoxFit.cover,
                        ),
                      ),
                    Center(
                      child: Image.network(
                        pageConfig["logo"],
                        width: 200,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 28.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
