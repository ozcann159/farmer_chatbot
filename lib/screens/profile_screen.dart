import 'dart:io';

import 'package:farmer_chatbot/screens/edit_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String userImage;
  final String userName;
  final String userSurname;
  final String userEmail;
  final String userPhone;

  const ProfileScreen({
    super.key,
    required this.userImage,
    required this.userName,
    required this.userSurname,
    required this.userEmail,
    required this.userPhone,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String userName;
  late String userSurname;
  late String userEmail;
  late String userPhone;

  @override
  void initState() {
    super.initState();
    userName = widget.userName;
    userSurname = widget.userSurname;
    userEmail = widget.userEmail;
    userPhone = widget.userPhone;
  }

  // Logout işlemi
  void _logout() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _editProfileField() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          userImage: widget.userImage,
          userName: userName,
          userSurname: userSurname,
          userEmail: userEmail,
          userPhone: userPhone,
        ),
      ),
    );

    if (result != null && result is Map) {
      setState(() {
        userName = result['name'] ?? userName;
        userSurname = result['surname'] ?? userSurname;
        userEmail = result['email'] ?? userEmail;
        userPhone = result['phone'] ?? userPhone;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          color: const Color(0xFFE8F5E9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                        backgroundImage: widget.userImage.startsWith('http')
                            ? NetworkImage(widget.userImage)
                            : FileImage(File(widget.userImage))
                                as ImageProvider),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SizedBox(
                        height: 46,
                        width: 46,
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.grey,
                            size: 24,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _editProfileField, 
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 70.0, vertical: 12.0),
                  backgroundColor: const Color(0xFF81C784),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.black26,
                  elevation: 5,
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              ListTile(
                title: Text(
                  '$userName $userSurname',
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                subtitle: const Text("Full Name"),
                leading: const Icon(CupertinoIcons.person),
                tileColor: Colors.white,
              ),
              const SizedBox(height: 20),
              ListTile(
                title: Text(
                  userEmail,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                subtitle: const Text("Email"),
                leading: const Icon(CupertinoIcons.mail),
                tileColor: Colors.white,
              ),
              const SizedBox(height: 20),
              ListTile(
                title: Text(
                  userPhone,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                subtitle: const Text("Phone"),
                leading: const Icon(CupertinoIcons.phone),
                tileColor: Colors.white,
              ),
              const SizedBox(height: 30),
              const Divider(),
              ListTile(
                title: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                leading: const Icon(CupertinoIcons.power),
                tileColor: Colors.white,
                onTap: _logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
