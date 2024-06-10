import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact {
  final String name;
  final String phone;
  final String email;
  final String address;

  Contact({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });
}

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact> contacts = [
    Contact(
      name: 'John Doe',
      phone: '(123) 456-7890',
      email: 'johndoe@example.com',
      address: '123 Main St, Anytown, CA 12345',
    ),
    Contact(
      name: 'Jane Smith',
      phone: '(987) 654-3210',
      email: 'janesmith@example.com',
      address: '456 Elm St, Anytown, CA 12345',
    ),
  ];

  bool _isDarkMode = false;

  void toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      if (_isDarkMode) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text('İletişim'),
        actions: [
          IconButton(
            onPressed: toggleDarkMode,
            icon: Icon(
              _isDarkMode ? Icons.sunny : Icons.nightlight,
              color: _isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  Contact contact = contacts[index];
                  return Card(
                    color: _isDarkMode ? Colors.grey[800] : Colors.grey[200],
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contact.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Telefon: ${contact.phone}',
                            style: TextStyle(
                              color:
                                  _isDarkMode ? Colors.white70 : Colors.black54,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'E-posta: ${contact.email}',
                            style: TextStyle(
                              color:
                                  _isDarkMode ? Colors.white70 : Colors.black54,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Adres: ${contact.address}',
                            style: TextStyle(
                              color:
                                  _isDarkMode ? Colors.white70 : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Öneri ve şikayetleriniz için iletisim@restaurant.com.tr adresine e-posta gönderebilirsiniz.',
              style: TextStyle(
                fontSize: 16,
                color: _isDarkMode ? Colors.white70 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
