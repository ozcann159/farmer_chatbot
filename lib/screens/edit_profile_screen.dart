import 'dart:io';

import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String userImage;
  final String userName;
  final String userSurname;
  final String userEmail;
  final String userPhone;

  const EditProfileScreen({
    super.key,
    required this.userImage,
    required this.userName,
    required this.userSurname,
    required this.userEmail,
    required this.userPhone,
  });

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _surnameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userName);
    _surnameController = TextEditingController(text: widget.userSurname);
    _emailController = TextEditingController(text: widget.userEmail);
    _phoneController = TextEditingController(text: widget.userPhone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    Map<String, String> updatedProfile = {
      'name': _nameController.text,
      'surname': _surnameController.text,
      'email': _emailController.text,
      'phone': _phoneController.text,
    };
    print('Updated Profile: $updatedProfile');
    Navigator.pop(context, updatedProfile);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            color: const Color(0xFFE8F5E9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                                as ImageProvider,
                      ),
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
                const SizedBox(height: 20),
                _buildTextField(
                    'Name', Icons.person_outline_outlined, _nameController),
                const SizedBox(height: 20),
                _buildTextField('Surname', Icons.person_outline_outlined,
                    _surnameController),
                const SizedBox(height: 20),
                _buildTextField(
                    'Email', Icons.email_outlined, _emailController),
                const SizedBox(height: 20),
                _buildTextField('Phone', Icons.phone, _phoneController),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                 
                    _saveChanges();
                  },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField(
    String hintText, IconData icon, TextEditingController controller,
    {bool isPassword = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    child: TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: Colors.green,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    ),
  );
}
