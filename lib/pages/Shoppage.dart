import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cart.dart';
import '../components/food.dart';
import '../components/foodtile.dart';

class Shoppage extends StatefulWidget {
  const Shoppage({super.key});

  @override
  State<Shoppage> createState() => _ShoppageState();
}

class _ShoppageState extends State<Shoppage> {
  // final List<food> menu = [
  //   food(
  //     name: 'JUICY BURGER.',
  //     price: "19.00",
  //     imgpath: 'assets/images/burger.png',
  //     desc:
  //         'A juicy burger stacked with a tender mock meat patty, melted cheese, fresh veggies, and a burst of savory flavor in every bite.',
  //   ),
  //   food(
  //     name: 'CRIPSY DOSA.',
  //     price: "23.00",
  //     imgpath: 'assets/images/dosa.png',
  //     desc:
  //         'A crispy, golden South Indian crepe made from fermented rice and lentil batter, served hot with chutney and sambar.',
  //   ),
  //   food(
  //     name: 'NOODLES.',
  //     price: "25.00",
  //     imgpath: 'assets/images/noodles.png',
  //     desc:
  //         'Savory stir-fried noodles tossed with vibrant veggies, spices, and a splash of soy for a deliciously satisfying bite.',
  //   ),
  //   food(
  //     name: 'PASTA.',
  //     price: "30.00",
  //     imgpath: 'assets/images/pasta.png',
  //     desc:
  //         'Creamy, flavorful pasta cooked to perfection and tossed with rich sauce, herbs, and your favorite toppings for a comforting classic.',
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return Consumer<cart>(
      builder: (context, value, child) => Column(
        // child: Text('data'),
        children: [
          // search
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Color(0xFFB6BCC3),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Search'), Icon(Icons.search)],
            ),
          ),

          //msg
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              "Hungry?..... Don't grab a Snickers , eat real food",
              style: TextStyle(color: Color(0xFF6B6F73)),
            ),
          ),

          //hotpics
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hot Picks for you🔥",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text("See all"),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: value.getmenu().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                food khana = value.getmenu()[index];

                return foodtile(
                  khana: khana,
                  ontap: () => addfoodtocart(khana),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addfoodtocart(food khana) {
    Provider.of<cart>(context, listen: false).additem(khana);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text("Added Sucessfully")),
    );
  }
}
