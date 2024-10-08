import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFE8F5E9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/farmer_image.png',
                width: screenSize.width * 0.6,
                height: screenSize.height * 0.3,
              ),
              SizedBox(height: screenSize.height * 0.02),
              Padding(
                padding: EdgeInsets.all(screenSize.width * 0.05),
                child: const Text(
                  'NovaGPT - Your Al Farming Assistant',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: screenSize.height * 0.01),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Discovery NovaGPT, your Al - powered farming assistant. Get tailored advice for crops like tomatoes,peppers and strawberries, covering irrigation, nutrients and disease detection. Simpfly farming and boost your yield with smart, timely insight!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: screenSize.width * 0.035),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              ElevatedButton(
                onPressed: () {},
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
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
