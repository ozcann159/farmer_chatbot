import 'package:farmer_chatbot/screens/outdoorSpacesScreen.dart';
import 'package:farmer_chatbot/screens/outdoorSpacesScreen1.dart';
import 'package:farmer_chatbot/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateSpaceScreen extends StatefulWidget {
  const CreateSpaceScreen({super.key});

  @override
  State<CreateSpaceScreen> createState() => _CreateSpaceScreenState();
}

class _CreateSpaceScreenState extends State<CreateSpaceScreen> {
  String? _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: AppBar(
            backgroundColor: backgroundColor,
            title: const Text(
              'Create Space',
            ),
            centerTitle: true,
            titleTextStyle: const TextStyle(color: appbarColor, fontSize: 17),
            iconTheme: const IconThemeData(color: Colors.green),
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OutdoorSpacesScreen(),
                  ),
                );
              },
              icon: const Icon(CupertinoIcons.back),
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
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location Name",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Text(
              "DEVİCE Name",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _chosenValue,
                  icon: const Icon(
                    CupertinoIcons.chevron_down,
                    color: Colors.black,
                  ),
                  dropdownColor: Colors.white,
                  style: const TextStyle(color: Colors.black),
                  items: <String>[
                    'Device 1',
                    'Device 2',
                    'Device 3',
                    'Device 4',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _chosenValue = newValue;
                    });
                  },
                  hint: const Text(
                    "Choose a device",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(height: 70.0),
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _chosenValue,
                  icon: const Icon(
                    CupertinoIcons.chevron_down,
                    color: Colors.black,
                  ),
                  dropdownColor: Colors.white,
                  style: const TextStyle(color: Colors.black),
                  items: <String>[
                    'Device 1',
                    'Device 2',
                    'Device 3',
                    'Device 4',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _chosenValue = newValue;
                    });
                  },
                  hint: const Text(
                    "Choose a device",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OutdoorSpacesScreen1())),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                  backgroundColor: const Color(0xFF11C166),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text('Add Device',
                    style: TextStyle(fontSize: 18.0, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
