import 'package:farmer_chatbot/screens/enter_code_screen.dart';
import 'package:farmer_chatbot/screens/login_screen.dart';
import 'package:farmer_chatbot/utils/constants.dart';
import 'package:farmer_chatbot/widgets/custom_email_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Forgot Password',
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: appbarColor, fontSize: 17),
        iconTheme: IconThemeData(color: Colors.green),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Please enter your email address. We will send you a link to reset your password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 30),
                const CustomEmailTextField(
                  hintText: 'Enter your e-mail',
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const EnterCodeScreen(), // Yeni sayfaya yönlendirme
                      ),
                    );
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
                    'Forgot Password',
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
