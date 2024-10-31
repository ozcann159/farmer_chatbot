// widgets/chat_message.dart
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isSentByMe;

  const ChatMessage({super.key, required this.message, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSentByMe ? Color(0xFF11C166) : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(message, style: TextStyle(color: isSentByMe ? Colors.white : Colors.black)),
      ),
    );
  }
}
