// lib/widgets/custom_password_text_field.dart
import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;

  const CustomPasswordTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
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
    );
  }
}
