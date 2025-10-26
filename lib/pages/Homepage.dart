import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/bottom_nav.dart';
import 'Cartpage.dart';
import 'Shoppage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 0;

  final List<Widget> pages = [
    const Shoppage(),
    const Cartpage(),

    //const Profilepage();
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomnavbar(
        onTabChange: (index) => setState(() {
          this.index = index;
        }),
      ),
      body: pages[index],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 2,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.restaurant_menu_sharp),
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFFF4D9D0),
        child: Column(
          children: [
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DrawerHeader(
                  child: Image.asset(
                    'assets/images/pngwing.png',
                    color: Color(0xFFCD5656),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(thickness: 1, color: Color(0xFFA64C64)),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text('home', selectionColor: Color(0xFF77263B)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart_outlined),
                    title: Text('cart', selectionColor: Color(0xFF77263B)),
                  ),
                ),
              ],
            ),

            // Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 25.0),
            //    child: Divider(
            //      thickness: 1,
            //      color: Color(0xFFA64C64),
            //    ),
            // ),
            //
            //
            // Padding(
            //   padding: const EdgeInsets.only(left:25.0),
            //   child: ListTile(
            //     leading: Icon(Icons.home),
            //     title: Text('Home',selectionColor: Color(0xFF77263B) ,
            //     ),
            //
            //   ),
            // ),
            //
            // Padding(
            //   padding: const EdgeInsets.only(left:25.0),
            //   child: ListTile(
            //     leading: Icon(Icons.info_outline_rounded),
            //     title: Text('Home',selectionColor: Color(0xFF77263B) ,
            //     ),
            //
            //   ),
            // ),
            const SizedBox(height: 500),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout_sharp),
                title: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text('LOGOUT', selectionColor: Color(0xFF77263B)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
