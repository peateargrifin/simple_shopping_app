import 'package:flutter/material.dart';
import 'package:shopping1/pages/loginpg.dart';
import 'package:shopping1/pages/register.dart';

class loginorregipg extends StatefulWidget {
  const loginorregipg({super.key});

  @override
  State<loginorregipg> createState() => _loginorregipgState();
}

class _loginorregipgState extends State<loginorregipg> {
  bool showlogin = true;

  void toggle() {
    setState(() {
      showlogin = !showlogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showlogin) {
      return loginpg(onpress: toggle);
    } else {
      return registerpg(togl: toggle);
    }
  }
}
