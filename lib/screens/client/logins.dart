import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Logins extends StatefulWidget {
  const Logins({Key? key}) : super(key: key);

  @override
  State<Logins> createState() => _LoginsState();
}

class _LoginsState extends State<Logins> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isDarkMode = false;

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
      if (isDarkMode) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      }
    });
  }

  void tryLogin() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email ve şifre boş bırakılamaz'),
        ),
      );
      return;
    }

    try {
      http.Response response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        String token = responseData['token'];

        if (token != null) {
          print('Giriş başarılı, token: $token');

          // Kullanıcı bilgilerini kontrol et
          if (email == 'george.bluth@reqres.in') {
            // George Bluth yetkileri: sadece restaurantları görebilme
            // Burada gerekli işlemleri gerçekleştirin
            GoRouter.of(context).go('/restaurant');
          } else if (email == 'emma.wong@reqres.in') {
            // Emma Wong yetkileri: tüm yetkiler
            // Burada gerekli işlemleri gerçekleştirin
            // Örnek olarak:
            GoRouter.of(context).go('/admin');
          } else {
            // Diğer kullanıcılar için yapılacak işlem
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Giriş başarısız: Kullanıcı bilgileri hatalı'),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Giriş başarısız: API yanıtı ${response.statusCode}'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Hata oluştu: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode
          ? const Color.fromARGB(255, 32, 31, 31)
          : const Color.fromARGB(0, 247, 234, 234),
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
              color: isDarkMode
                  ? Colors.white
                  : const Color.fromARGB(255, 50, 50, 50)),
        ),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        backgroundColor: isDarkMode
            ? const Color.fromARGB(255, 24, 23, 23)
            : const Color.fromARGB(255, 244, 242, 242),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.sunny : Icons.nightlight,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: toggleDarkMode,
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: isDarkMode
                ? const Color.fromARGB(255, 5, 5, 5)
                : Colors.grey[200],
          ),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 13, 13, 13),
                        ),
                      ),
                      labelText: 'Enter your mail..',
                      labelStyle: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 6, 5, 5),
                        ),
                      ),
                      labelText: 'Enter your password..',
                      labelStyle: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? Colors.white : Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: tryLogin,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: isDarkMode ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
