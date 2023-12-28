import 'package:flutter/material.dart';

class MyBottomNavigator extends StatelessWidget {
  const MyBottomNavigator(
      {super.key, required this.currentIndex, required this.changeScreen});
  final int currentIndex;
  final dynamic changeScreen;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
     borderRadius: const BorderRadius.only( 
      topLeft: Radius.circular(20), 
      topRight: Radius.circular(20)
     ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepOrange[400],
        unselectedItemColor: Colors.black45,
        iconSize: 33,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Maison",),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_checkout_rounded), label: "Mes achats"),
        ],
        onTap: (index) => changeScreen(index),
      ),
    );
  }
}
