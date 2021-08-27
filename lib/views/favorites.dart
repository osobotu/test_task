import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/viewmodels/color_view_model.dart';

class FavoritesView extends StatelessWidget {
  static String routeName = '/favorites_page';
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<ColorViewModel>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.getFavoriteColors.length,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          itemBuilder: (context, index) =>
              FavoriteColorTile(color: value.getFavoriteColors[index]),
        ),
      ),
    );
  }
}

class FavoriteColorTile extends StatelessWidget {
  const FavoriteColorTile({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    final String red = color.red.toString();
    final String green = color.green.toString();
    final String blue = color.blue.toString();
    final String opacity = color.opacity.toStringAsFixed(2);

    return ListTile(
      tileColor: color,
      title: Text("R:$red G:$green B:$blue Op:$opacity"),
      trailing: IconButton(
        onPressed: () {
          Provider.of<ColorViewModel>(context, listen: false).remove(color);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: const Text('Removed from favorites.'),
              duration: const Duration(milliseconds: 500),
            ),
          );
        },
        icon: const Icon(Icons.close),
      ),
    );
  }
}
