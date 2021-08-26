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

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    RandomColor _randomColor =
        Provider.of<ColorViewModel>(context).getRandomColor;
    return SafeArea(
      child: Scaffold(
        body: InkWell(
          onTap: () {
            _onTap(context);
          },
          child: Consumer<ColorViewModel>(
            builder: (context, _, child) {
              return Container(
                width: _size.width,
                height: _size.height,
                decoration: BoxDecoration(color: _randomColor.color),
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
      ),
    );
  }
}
