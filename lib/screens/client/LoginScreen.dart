import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isDarkMode = false; // Başlangıçta dark mode kapalı olarak ayarlandı

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode; // Dark mode durumunu tersine çevir
      if (isDarkMode) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Color.fromARGB(255, 2, 2, 2) : Colors.white,
      appBar: AppBar(
        title: Text(
          "Welcome To RESTARANTUS",
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor:
            isDarkMode ? Color.fromARGB(255, 12, 12, 12) : Colors.white,
        actions: [
          IconButton(
            onPressed: toggleDarkMode, // Toggle function for dark mode
            icon: Icon(
              isDarkMode ? Icons.sunny : Icons.nightlight,
              color: isDarkMode
                  ? Colors.white
                  : const Color.fromARGB(255, 45, 45, 45),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logos.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                isDarkMode
                    ? Colors.black.withOpacity(0.7)
                    : Colors.white.withOpacity(0.7),
                BlendMode.darken,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150, // Sabit genişlik
                    height: 50, // Sabit yükseklik
                    child: ElevatedButton(
                      onPressed: () => context.push("/logins"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isDarkMode ? Colors.black : Colors.white,
                        foregroundColor:
                            isDarkMode ? Colors.white : Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Login"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150, // Sabit genişlik
                    height: 50, // Sabit yükseklik
                    child: ElevatedButton(
                      onPressed: () => context.push("/register"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isDarkMode ? Colors.black : Colors.white,
                        foregroundColor:
                            isDarkMode ? Colors.white : Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Register"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150, // Sabit genişlik
                    height: 50, // Sabit yükseklik
                    child: ElevatedButton(
                      onPressed: () => context.push("/contact"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isDarkMode ? Colors.black : Colors.white,
                        foregroundColor:
                            isDarkMode ? Colors.white : Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Contact"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
