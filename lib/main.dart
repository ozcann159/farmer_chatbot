import 'package:farmer_chatbot/screens/login_screen.dart'; // Login ekranınızı buradan içe aktarın
import 'package:farmer_chatbot/screens/splash_screen.dart';
import 'package:farmer_chatbot/screens/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmer Chatbot',
      initialRoute: '/', // Ana rota
      routes: {
        '/': (context) => const SplashScreen(), // Ana ekran
        '/login': (context) => const LoginScreen(), // Giriş ekranı
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const Onboarding());
      },
    );
  }
}
