// widgets/custom_text_field.dart
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;

  const CustomTextField({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              hintText: labelText,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ],
      ),
    );
  }
}
