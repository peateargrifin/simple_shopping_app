import 'package:flutter/material.dart';

import 'food.dart';

class foodtile extends StatelessWidget {
  food khana;
  void Function()? ontap;
  foodtile({super.key, required this.khana, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(left: 25),
        width: 280,
        decoration: BoxDecoration(
          color: Color(0xFFFFEDFA),
          //backgroundBlendMode: BlendMode.color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //shoe pic
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child:
                  // 2. Use a SizedBox to constrain the image's height
                  SizedBox(
                    height: 240, // Set a fixed height for all images
                    width:
                        double.infinity, // Make it fill the width of the tile
                    child: Image.asset(
                      khana.imgpath,
                      fit: BoxFit.cover, // This is the magic property!
                    ),
                  ),
            ),
            //Image.asset(khana.imgpath)

            //desc
            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                khana.desc,
                style: TextStyle(color: Color(0xFF921A40)),
              ),
            ),

            //price deatils
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            khana.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),

                          //Icon(Icons.add_box_sharp,color: Color(0xFF973131),),
                        ],
                      ),

                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$' + khana.price,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: ontap,
                    child: Icon(
                      Icons.add_box_sharp,
                      color: Color(0xFF973131),
                      size: 29,
                      // Optional: make the icon a bit bigger
                    ),
                  ),
                ],
              ),
            ),

            ///
            ///
            SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}
