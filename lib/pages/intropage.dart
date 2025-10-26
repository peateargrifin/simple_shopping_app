import 'package:flutter/material.dart';
import 'package:shopping1/pages/Homepage.dart';
import 'package:shopping1/pages/authpage.dart';
import 'package:shopping1/pages/loginpg.dart';

class intropage extends StatelessWidget {
  const intropage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 39.0, horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //logo//////////////////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset('assets/images/pngwing.png', height: 240),
              ),
              const SizedBox(height: 89),

              //title/////////////////////////////////////////
              Text(
                'O R D E R  O N L I N E',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),

              //subtit
              Text(
                'Fresh hot food , delivered at your doorstep',
                style: TextStyle(fontSize: 15, color: Color(0x5E62679E)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              //start now
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => authpage()),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFB87C4C),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: const Text(
                        'Start Munching',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
}
