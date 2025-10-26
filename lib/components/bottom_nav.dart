import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomnavbar extends StatelessWidget {
  void Function(int)? onTabChange;
  bottomnavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        padding: EdgeInsets.all(30),
        gap: 8,
        color: Color(0xFFE5BEB5),
        activeColor: Color(0xFFB45253),
        tabActiveBorder: Border.all(color: Color(0xFFEEE6CA)),
        tabBackgroundColor: Color(0xFFEBD9D1),
        tabBorderRadius: 10,
        onTabChange: (value) => onTabChange!(value),
        tabs: [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.shopping_cart, text: 'Cart'),
          //GButton(icon: ),
          //GButton(icon: icon),
        ],
      ),
    );
  }
}
