import 'package:flutter/widgets.dart';

import 'food.dart';

class cart extends ChangeNotifier {
  final List<food> menu = [
    food(
      name: 'JUICY BURGER.',
      price: "19.00",
      imgpath: 'assets/images/burger.png',
      desc:
          'A juicy burger stacked with a tender mock meat patty, melted cheese, fresh veggies, and a burst of savory flavor in every bite.',
    ),
    food(
      name: 'CRIPSY DOSA.',
      price: "23.00",
      imgpath: 'assets/images/dosa.png',
      desc:
          'A crispy, golden South Indian crepe made from fermented rice and lentil batter, served hot with chutney and sambar.',
    ),
    food(
      name: 'NOODLES.',
      price: "25.00",
      imgpath: 'assets/images/noodles.png',
      desc:
          'Savory stir-fried noodles tossed with vibrant veggies, spices, and a splash of soy for a deliciously satisfying bite.',
    ),
    food(
      name: 'PASTA.',
      price: "30.00",
      imgpath: 'assets/images/pasta.png',
      desc:
          'Creamy, flavorful pasta cooked to perfection and tossed with rich sauce, herbs, and your favorite toppings for a comforting classic.',
    ),
  ];

  final List<food> useradded = [];

  List<food> getmenu() {
    return menu;
  }

  List<food> getuseradded() {
    return useradded;
  }

  void additem(food khana) {
    useradded.add(khana);
    notifyListeners();
  }

  void removeitem(food khana) {
    useradded.remove(khana);
    notifyListeners();
  }
}
