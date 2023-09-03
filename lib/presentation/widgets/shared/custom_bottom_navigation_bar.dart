import 'package:flutter/material.dart';


class CustomBottomNavigationBar extends StatelessWidget {

  const CustomBottomNavigationBar ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_max),
        ),
        BottomNavigationBarItem(
          label: 'Categories',
          icon: Icon(Icons.label_outline),
        ),
        BottomNavigationBarItem(
          label: 'Favorites',
          icon: Icon(Icons.favorite_outline),
        )
      ]
    );
  }
}