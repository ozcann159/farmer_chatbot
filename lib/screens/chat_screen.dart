import 'package:farmer_chatbot/widgets/chat_message.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ChatMessage(message: 'Merhaba, nasıl yardımcı olabilirim?', isSentByMe: false),
                ChatMessage(message: 'Merhaba, tarım hakkında bazı sorularım var.', isSentByMe: true),
              ],
            ),
          ),
          _buildMessageInputField(),
        ],
      ),
    );
  }

  Widget _buildMessageInputField() {
    final TextEditingController _controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Write now...',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
