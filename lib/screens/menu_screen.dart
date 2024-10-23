import 'package:farmer_chatbot/screens/login_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _currentIndex = 0;

  final List<Widget> _screen = [
    MenuPage(), // Menu sayfa
    ChatPage(), // Chat sayfa
    ProfilePage(), // Profil sayfa
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screen[_currentIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 0.5, thickness: 0.5, color: Colors.grey),
          BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_sharp),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

// Menü sayfası
class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Menu View'),
    );
  }
}

// Sohbet sayfası
class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Chat Page'),
    );
  }
}

// Profil sayfası
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.blue),
          onPressed: () {
            Navigator.of(context).pop(); // Geri navigasyonu
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30.0),
                SizedBox(
                  height: 115,
                  width: 115,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircleAvatar(),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SizedBox(
                          height: 46,
                          width: 46,
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.grey,
                              size: 24,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 70.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildTextFieldWithLabel('Full Name'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildTextFieldWithLabel('Email'),
                ),
                const SizedBox(height: 50.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 12),
                      backgroundColor: const Color(0xFF11C166),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadowColor: Colors.black26,
                      elevation: 5,
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
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

// TextField ve üst kısımdaki yazılar
Widget _buildTextFieldWithLabel(String labelText) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: labelText,
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    ),
  );
}
