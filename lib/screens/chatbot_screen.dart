import 'package:flutter/material.dart';

class ChatbotScreen extends StatelessWidget {
  final String userName;
  final String userSurname;
  final String userImage;

  const ChatbotScreen({
    Key? key,
    required this.userName,
    required this.userSurname,
    required this.userImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color(0xFF81C784),
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(userImage),
                ),
                const SizedBox(height: 10),

                // Hoşgeldin Mesajı
                Text(
                  'Welcome $userName $userSurname',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'NovaGPT',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Welcome to the world of farming!',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Merhaba çiftçi!',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Hello, farmer!',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Which language would you like to speak?',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  const LanguageOptions(),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LanguageOptions extends StatelessWidget {
  const LanguageOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deutsch: Merhaba çiftçi',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        Text(
          'Français: Bonjour, agriculteur',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        Text(
          'Italiano: Ciao, contadino',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        Text(
          'Español: ¡Hola, agricultor!',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}
