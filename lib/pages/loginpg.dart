import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping1/services/auth_service.dart';

import 'Homepage.dart';

class loginpg extends StatefulWidget {
  const loginpg({super.key , required this.onpress});

  final Function()? onpress ;

  @override
  State<loginpg> createState() => _loginpgState();
}

class _loginpgState extends State<loginpg> {
  //final control;
  late final idcontrol = TextEditingController();
  late final passcontrol = TextEditingController();
  late bool obscure = true;

  Future<void> signin() async {
    // Show loading dialog FIRST
    showDialog(
      context: context,
      //barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    // Navigator.pop(context);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: idcontrol.text,
        password: passcontrol.text,
        //Navigator.pop(context);
      );

      // Success - pop the loading dialog

      Navigator.pop(context);

      //print('Login successful!'); // Debug print

      // Navigate to next screen or show success
    } on FirebaseAuthException catch (e) {
      // Pop the loading dialog first
      Navigator.pop(context);

      print('Error code: ${e.code}'); // Debug print to see actual error
      print('Error message: ${e.message}'); // Debug print

      String errorMessage = '';

      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Invalid email format.';
      } else if (e.code == 'invalid-credential') {
        errorMessage = 'Invalid email or password.';
      } else {
        errorMessage = 'An error occurred: ${e.message}';
      }

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo or App Name
                    Icon(Icons.lock_outline, size: 80, color: Colors.blue[700]),
                    const SizedBox(height: 20),
                    Text(
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Login to your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 40),
            
                    // ID TextField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        controller: idcontrol,
                        decoration: InputDecoration(
                          labelText: 'User ID',
                          hintText: 'Enter your ID',
                          prefixIcon: const Icon(Icons.person_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.blue[700]!,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
            
                    // Password TextField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        controller: passcontrol,
                        obscureText: obscure,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                            child: obscure
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.blue[700]!,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //const SizedBox(height: 10),
            
                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.blue[700]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
            
                    // Login Button
                    GestureDetector(
                      onTap: signin,
            
                      //style: ElevatedButton.styleFrom(
                      // fixedSize: const Size(20, 60),
                      child: Container(
                        height: 60,
                        // backgroundColor: Colors.blue[700],
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
            
                          //),)
                        ),
                      ),
                    ),
            
                    const SizedBox(height: 10),
            
                    // Sign Up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        TextButton(
                          onPressed: widget.onpress,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
            
                    const SizedBox(height: 20),
            
                    Row(
                      children: [
                        Expanded(
                          child: Divider(thickness: 0.5, color: Colors.grey[400]),
                        ),
                        Text('Or continue with.'),
            
                        Expanded(
                          child: Divider(thickness: 0.5, color: Colors.grey[400]),
                        ),
                      ],
                    ),
            
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 80, top: 15),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () => authserv().signgoogle(),
            
                                child: Image.asset(
                                  'assets/images/google.png',
            
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
            
                        SizedBox(width: 90),
            
                        InkWell(
                          onTap: () {},
            
                          child: Image.asset(
                            'assets/images/applee.png',
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
