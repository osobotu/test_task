import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_app/models/random_color.dart';
import 'package:test_app/viewmodels/color_vm.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  void _onTap(BuildContext context) {
    print('tap...');
    Provider.of<ColorViewModel>(context, listen: false).generateRandomColor();
  }

  void _saveColor(BuildContext context, RandomColor color) {
    print('Color saved');
    Provider.of<ColorViewModel>(context, listen: false).saveRandomColor(color);
  }

  void viewFavoriteColors(BuildContext context) {
    print("showing favorite colors");
    Provider.of<ColorViewModel>(context, listen: false).getFavoriteColors;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    RandomColor randomColor =
        Provider.of<ColorViewModel>(context).getRandomColor;
    return SafeArea(
      child: Scaffold(
        body: InkWell(
          onTap: () {
            _onTap(context);
          },
          child: Consumer<ColorViewModel>(
            builder: (context, cart, child) {
              return Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(color: randomColor.color),
                child: Center(
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
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  _saveColor(context, randomColor);
                },
                child: Icon(Icons.save),
                tooltip: 'Save Color',
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                tooltip: 'view favorites',
                onPressed: () {
                  // TODO: When this is tapped, should navigate to the favorite page. Use Navigator 2.0.
                },
                child: Icon(Icons.favorite_border_outlined),
              ),
            )
          ],
        ),
      ),
    );
  }
}
