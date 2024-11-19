import 'package:farmer_chatbot/utils/constants.dart';
import 'package:farmer_chatbot/widgets/custom2_text_field.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                const SizedBox(height: 30.0),
                const CircleAvatar(radius: 57.5),
                const SizedBox(height: 70.0),
                const Custom2TextField(labelText: 'Full Name'),
                const Custom2TextField(labelText: 'Email'),
                const SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen())),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 12),
                    backgroundColor: const Color(0xFF11C166),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Logout',
                      style: TextStyle(fontSize: 18.0, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
