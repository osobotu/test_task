import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/viewmodels/color_view_model.dart';
import 'package:test_app/views/favorites.dart';

class HomeView extends StatelessWidget {
  static String routeName = '/';
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var colorViewModel = Provider.of<ColorViewModel>(context);
    Color randomColor = colorViewModel.getRandomColor;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Test Task'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, FavoritesView.routeName);
              },
              icon: const Icon(Icons.favorite_border_outlined),
            )
          ],
        ),
        body: InkWell(
          onTap: () {
            print('tap...');
            Provider.of<ColorViewModel>(context, listen: false)
                .generateRandomColor();
          },
          child: Consumer<ColorViewModel>(
            builder: (context, _, child) {
              return Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(color: randomColor),
                child: const Center(
                  child: const Text(
                    'Hey there',
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('color saved ...');
            !colorViewModel.getFavoriteColors.contains(randomColor)
                ? colorViewModel.add(randomColor)
                : colorViewModel.remove(randomColor);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    colorViewModel.getFavoriteColors.contains(randomColor)
                        ? 'Added to favorites.'
                        : 'Removed from favorites'),
                duration: const Duration(milliseconds: 500),
              ),
            );
          },
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}
