import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isSentByMe;

  const ChatMessage({
    super.key,
    required this.message,
    required this.isSentByMe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isSentByMe
            ? Colors.green[100]
            : Colors.grey[200], // Kullanıcı yanıtı yeşil, otomatik yanıt gri
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        message,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}
