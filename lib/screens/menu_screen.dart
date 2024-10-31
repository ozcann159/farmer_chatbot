import 'package:farmer_chatbot/screens/%C4%B1ndoorSpacesScreen.dart';
import 'package:farmer_chatbot/screens/devicesScreen.dart';
import 'package:farmer_chatbot/screens/outdoorSpacesScreen.dart';
import 'package:farmer_chatbot/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';
import 'profile_page.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MenuPage(),
    const ChatPage(),
    const ProfilePage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.line_horizontal_3), label: 'Menu'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.ellipses_bubble), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_fill), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
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
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 2.0),
        child: ListView(
          children: [
            _buildMenuItem(
              context,
              'Outdoor Spaces',
              const OutdoorSpacesScreen(),
            ),
            const Divider(),
            _buildMenuItem(
              context,
              'Indoor Spaces',
              const IndoorSpacesScreen(),
            ),
            const Divider(),
            _buildMenuItem(
              context,
              'Devices',
              const DevicesScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, Widget screen) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 17)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.blue,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}
