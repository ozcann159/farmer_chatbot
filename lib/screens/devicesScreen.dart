import 'package:farmer_chatbot/screens/menu_screen.dart';
import 'package:farmer_chatbot/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Devices',
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: appbarColor, fontSize: 17),
        iconTheme: IconThemeData(color: Colors.green),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuScreen(),
              ),
            );
          },
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: const Center(child: Text('Devices Content')),
    );
  }
}
