import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessageData> _messages = [
    ChatMessageData(
        message: 'Merhaba, nasıl yardımcı olabilirim?', isSentByMe: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatMessage(
                  message: _messages[index].message,
                  isSentByMe: _messages[index].isSentByMe,
                );
              },
            ),
          ),
          _buildMessageInputField(),
        ],
      ),
    );
  }

  Widget _buildMessageInputField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Arka plan rengi
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Gölgenin rengi
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // Gölgenin konumu
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Write now...',
                  hintStyle: TextStyle(
                      color: Colors.grey.shade400), // Daha silik gri renk
                  border: InputBorder.none, // Kenar çizgilerini kaldır
                  focusedBorder: InputBorder
                      .none, // Odaklandığında kenar çizgilerini kaldır
                  enabledBorder: InputBorder
                      .none, // Etkin olduğunda kenar çizgilerini kaldır
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10), // İçerik boşluğu
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      _sendMessage();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages
            .add(ChatMessageData(message: _controller.text, isSentByMe: true));
        _controller.clear();
      });

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _messages.add(ChatMessageData(
              message: 'Bu bir otomatik cevap mesajıdır.', isSentByMe: false));
        });
      });
    }
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isSentByMe;

  const ChatMessage(
      {super.key, required this.message, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: const EdgeInsets.all(12.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.green[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

// Mesaj verilerini tutacak sınıf
class ChatMessageData {
  final String message;
  final bool isSentByMe;

  ChatMessageData({required this.message, required this.isSentByMe});
}
