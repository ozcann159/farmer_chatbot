import 'package:farmer_chatbot/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _surnameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  // Yeni telefon kontrolcüsü
  final ImagePicker _picker = ImagePicker();

  XFile? _image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize.height * 0.2),
              const Text(
                'Create Your\nAccount',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                  color: Color.fromRGBO(110, 224, 20, 1),
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 15),
              _buildTextField('Full Name', Icons.person_2_outlined),
              _buildTextField('Enter Your E-mail', Icons.email_outlined),
              _buildPasswordField('Password', Icons.lock_clock_outlined),
              const SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 125, vertical: 12),
                    backgroundColor: const Color(0xFF11C166),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadowColor: Colors.black26,
                    elevation: 5,
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: 'Already Have An Account?  ',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )
                            // decoration: TextDecoration.underline),
                            )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // E-mail TextField
  Widget _buildTextField(String hintText, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: TextField(
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

  // Password TextField with toggle visibility icon
  Widget _buildPasswordField(String hintText, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: TextField(
        obscureText: _obscurePassword,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword
                  ? Icons.visibility
                  : Icons.visibility_off_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword; // Şifre göster/gizle
              });
            },
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
