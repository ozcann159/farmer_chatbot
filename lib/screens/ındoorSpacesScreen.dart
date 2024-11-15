import 'package:farmer_chatbot/screens/create_space_screen.dart';
import 'package:farmer_chatbot/screens/menu_screen.dart';
import 'package:farmer_chatbot/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndoorSpacesScreen extends StatelessWidget {
  const IndoorSpacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: AppBar(
            backgroundColor: backgroundColor,
            title: const Text(
              'Indoor Spaces',
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
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1.0),
              child: Divider(
                color: Colors.grey[300],
                thickness: 1.0,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOutdoorSpaceContainer('Add Space', '', null, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateSpaceScreen(),
                    ),
                  );
                }),
                _buildOutdoorSpaceContainer(
                    'Indoor Space 1', '3 Devices', "assets/images/image7.png"),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOutdoorSpaceContainer(
                    'Indoor Space 2', '1 Devices', "assets/images/image6.png"),
                _buildOutdoorSpaceContainer(
                    'Indoor Space 3', '1 Devices', "assets/images/image6.png"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutdoorSpaceContainer(
      String title, String deviceCount, String? imagePath,
      [VoidCallback? onTap]) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 165,
          height: 175,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (imagePath != null)
                Image.asset(
                  imagePath,
                  width: 90,
                  height: 60,
                  fit: BoxFit.cover,
                )
              else
                Text(
                  'Add ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                  textAlign: TextAlign.center,
                ),
              Text(
                'Space',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]),
                textAlign: TextAlign.center,
              ),
              if (imagePath != null) ...[
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    deviceCount,
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
