import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite view',
          style: TextStyle()
        ),
      ),
      body: const Center(
        child: Text(
          'Favorites view',
          style: TextStyle()
        ),
      ),
    );
  }
}
