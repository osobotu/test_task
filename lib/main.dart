import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/viewmodels/color_vm.dart';
import 'package:test_app/views/favorites.dart';

import 'package:test_app/views/home.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorViewModel>(
      create: (context) => ColorViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test Task',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: HomeView.routeName,
        routes: {
          HomeView.routeName: (context) => HomeView(),
          FavoritesView.routeName: (context) => FavoritesView(),
        },
      ),
    );
  }
}
