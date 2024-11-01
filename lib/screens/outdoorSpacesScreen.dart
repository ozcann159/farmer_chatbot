import 'package:farmer_chatbot/screens/menu_screen.dart';
import 'package:farmer_chatbot/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OutdoorSpacesScreen extends StatelessWidget {
  const OutdoorSpacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Outdoor Spaces',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Genel boşluk için
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildOutdoorSpaceContainer('Outdoor Space 1', '3 Devices'),
            _buildOutdoorSpaceContainer('Outdoor Space 2', '1 Device'),
          ],
        ),
      ),
    );
  }

  Widget _buildOutdoorSpaceContainer(String title, String deviceCount) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 165,
        height: 165,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              deviceCount,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
