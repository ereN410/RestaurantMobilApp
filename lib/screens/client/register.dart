import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isDarkMode = false; // Initial dark mode state

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode
          ? const Color.fromARGB(255, 34, 33, 33)
          : const Color.fromARGB(0, 247, 234, 234),
      appBar: AppBar(
        title: Text(
          "Register",
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
        ),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        backgroundColor: isDarkMode
            ? const Color.fromARGB(255, 32, 31, 31)
            : const Color.fromARGB(255, 244, 242, 242),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode
                  ? Icons.sunny
                  : Icons.nightlight, // Use sun icon for dark mode
              color: isDarkMode
                  ? Colors.white
                  : Colors.black, // Use white color for dark mode
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
                : Colors
                    .grey[200], // Adjust background color based on dark mode
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
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 13, 13, 13),
                        ),
                      ),
                      labelText: 'Enter your name..',
                      labelStyle: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 13, 13, 13),
                        ),
                      ),
                      labelText: 'Enter your phone number..',
                      labelStyle: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
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
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 13, 13, 13),
                        ),
                      ),
                      labelText: 'Enter your password..',
                      labelStyle: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  // Add SizedBox to center the button
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).go('/logins');
                    },
                    child: Text('Register'),
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
