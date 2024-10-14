import 'package:farmer_chatbot/models/user_model.dart';
import 'package:farmer_chatbot/screens/login_screen.dart';
import 'package:farmer_chatbot/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController =
      TextEditingController(); // Yeni telefon kontrolcüsü
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          color: const Color(0xFFE8F5E9),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Welcome to NovaGPT',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                _buildTextField('Enter your name', Icons.person,
                    controller: _nameController),
                _buildTextField('Enter your surname', Icons.person,
                    controller: _surnameController),
                _buildTextField('Enter your email', Icons.email,
                    controller: _emailController),
                _buildTextField('Enter your phone number', Icons.phone,
                    controller:
                        _phoneController), // Yeni telefon numarası girişi
                _buildTextField('Enter your password', Icons.lock,
                    controller: _passwordController, isPassword: true),
                _buildTextField('Confirm password', Icons.lock,
                    controller: _confirmPasswordController, isPassword: true),
                ElevatedButton(
                  onPressed: () async {
                    _image =
                        await _picker.pickImage(source: ImageSource.gallery);
                  },
                  child: const Text('Upload Profile Picture'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String name = _nameController.text;
                    String surname = _surnameController.text;
                    String email = _emailController.text;
                    String phone =
                        _phoneController.text; // Telefon numarasını alıyoruz

                    String userImage = _image != null
                        ? _image!.path
                        : 'https://example.com/default_avatar.png';

                    User user = User(
                      name: name,
                      surname: surname,
                      email: email,
                      phone: phone, // Telefonu buraya ekliyoruz
                      userImage: userImage,
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                          userImage: user.userImage,
                          userName: user.name,
                          userSurname: user.surname,
                          userEmail: user.email,
                          userPhone: user.phone,
                        ),
                      ),
                    );
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
                    'Register',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, IconData icon,
      {bool isPassword = false, TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.green),
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
}
