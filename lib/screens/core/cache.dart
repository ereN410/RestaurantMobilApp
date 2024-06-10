import 'dart:convert';
import 'package:flutter/services.dart';

class CacheSystem {
  Future<Map<String, dynamic>> getSplashConfig() async {
    String jsonString = await loadJsonFromAssets("assets/images/json/splash.json");
    Map<String, dynamic> data = jsonDecode(jsonString);
    return data;
  }

  Future<String> loadJsonFromAssets(String filePath) async {
    return await rootBundle.loadString(filePath);
  }
}

