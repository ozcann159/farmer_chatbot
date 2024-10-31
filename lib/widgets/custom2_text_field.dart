import 'package:flutter/material.dart';

class Custom2TextField extends StatelessWidget {
  final String labelText;

  const Custom2TextField({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              hintText: labelText,
              contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 10.0), // İç alanın padding'ini ayarlayın
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.blue, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
