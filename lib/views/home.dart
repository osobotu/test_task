import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/viewmodels/color_vm.dart';
import 'package:test_app/views/favorites.dart';

class HomeView extends StatelessWidget {
  static String routeName = '/';
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    var colorVM = Provider.of<ColorViewModel>(context);
    Color _randomColor = colorVM.getRandomColor;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Test Task'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, FavoritesView.routeName);
              },
              icon: Icon(Icons.favorite_border_outlined),
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
                width: _size.width,
                height: _size.height,
                decoration: BoxDecoration(color: _randomColor),
                child: const Center(
                  child: const Text(
                    'Hey there',
                    style: TextStyle(
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
            !colorVM.getFavoriteColors.contains(_randomColor)
                ? colorVM.add(_randomColor)
                : colorVM.remove(_randomColor);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(colorVM.getFavoriteColors.contains(_randomColor)
                    ? 'Added to favorites.'
                    : 'Removed from favorites'),
                duration: Duration(seconds: 1),
              ),
            );
          },
          child: Icon(Icons.save),
        ),
      ),
    );
  }
}
