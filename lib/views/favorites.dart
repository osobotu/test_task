import 'package:flutter/material.dart';
import 'package:test_app/models/random_color.dart';

class FavoritesView extends StatelessWidget {
  static String favoritesViewRoute = 'FavoriteView';
  const FavoritesView({Key? key, required this.favoriteColors})
      : super(key: key);
  final List<RandomColor> favoriteColors;

  @override
  Widget build(BuildContext context) {
    return Container();
    // TODO: This page should display a list view of the favorite colors using a listview builder.
    // I can also setup a listener here to give me the List of colors from the provider.
  }
}
