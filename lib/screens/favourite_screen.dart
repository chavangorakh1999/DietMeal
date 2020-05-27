import 'package:flutter/material.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;

  FavouritesScreen(this.favouriteMeal);
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('fav'),);
  }
}