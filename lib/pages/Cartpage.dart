import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../components/cart.dart';
import '../components/food.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<cart>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'My Cart.',
              style: TextStyle(
                color: Color(0xff070000),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: value.getuseradded().length,
              itemBuilder: (context, index) {
                food khana = value.getuseradded()[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 25,
                  ),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => value.removeitem(khana),
                          icon: Icons.delete,
                          backgroundColor: Color(0xFFA83856),
                        ),
                      ],
                    ),

                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                      tileColor: Color(0xFFFFEEF4),
                      leading: Image.asset(khana.imgpath),
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(khana.name),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('\$' + khana.price),
                      ),
                      // You can add a trailing icon to remove the item
                      // trailing: IconButton(
                      //   icon: const Icon(Icons.delete, color: Color(0xFFA83856)),
                      //   onPressed: () {
                      //     // Add remove from cart functionality here
                      //   },
                      // ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
