import 'package:farmer_chatbot/screens/create_space_screen.dart';
import 'package:farmer_chatbot/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OutdoorSpacesScreen1 extends StatelessWidget {
  const OutdoorSpacesScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> smartLambs = [
      {
        'title': 'Smart Lamb 1',
        'status': 'Active',
        'devices': '3 Devices',
      },
      {
        'title': 'Smart Lamb 2',
        'status': 'Deactive',
        'devices': '1 Device',
      },
      {
        'title': 'Smart Lamb 3',
        'status': 'Active',
        'devices': '2 Devices',
      },
    ];
    void showBottomSheet() {
      showModalBottomSheet(
        showDragHandle: true,
        isScrollControlled: true,
        backgroundColor: backgroundColor,
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 2.0),
                  child: Text(
                    'Outdoor Space 1 Inspect',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[400],
                  thickness: 1.0,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: smartLambs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(smartLambs[index]['title']!),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Status: ${smartLambs[index]['status']}'),
                              Text('Devices: ${smartLambs[index]['devices']}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: AppBar(
            backgroundColor: backgroundColor,
            title: const Text(
              'Outdoor Spaces 1',
            ),
            centerTitle: true,
            titleTextStyle: const TextStyle(color: appbarColor, fontSize: 17),
            iconTheme: const IconThemeData(color: Colors.green),
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateSpaceScreen(),
                  ),
                );
              },
              icon: const Icon(CupertinoIcons.back),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
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
                _buildOutdoorSpaceContainer('Smart Lamb 1', 'Active',
                    "assets/images/image-photoroom1.png"),
                _buildOutdoorSpaceContainer('Smart Lamb', 'Deactive',
                    "assets/images/image-photoroom1.png"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOutdoorSpaceContainer('Smart Lamb', '3 Devices',
                    "assets/images/image-photoroom1.png"),
                _buildOutdoorSpaceContainer('Smart Lamb', '1 Devices',
                    "assets/images/image-photoroom1.png"),
              ],
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => showBottomSheet(),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  backgroundColor: const Color(0xFF11C166),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Show Detail',
                    style: TextStyle(fontSize: 18.0, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget _buildOutdoorSpaceContainer(
      String title, String deviceCount, String imagePath) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
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
            Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 6),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                deviceCount,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
