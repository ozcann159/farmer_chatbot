
import 'package:farmer_chatbot/widgets/custom_password_text_field.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Password'),
        backgroundColor: const Color(0xFF81C784),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Please enter your new password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 30),
                const CustomPasswordTextField(
                  hintText: 'Enter new password',
                  icon: Icons.lock,
                ),
                const SizedBox(height: 20),
                const CustomPasswordTextField(
                  hintText: 'Confirm new password',
                  icon: Icons.lock,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Burada yeni şifre oluşturma işlemleri yapılabilir
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70.0, vertical: 12.0),
                    backgroundColor: const Color(0xFF81C784),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadowColor: Colors.black26,
                    elevation: 5,
                  ),
                  child: const Text(
                    'Create Password',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
