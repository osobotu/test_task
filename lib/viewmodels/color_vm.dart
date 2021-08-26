import 'package:flutter/material.dart';
import 'package:test_app/models/random_color.dart';
import 'package:test_app/services/color_service.dart';

class ColorViewModel extends ChangeNotifier {
  RandomColor _randomColor = ColorService().generateRandomColor();

  RandomColor get getRandomColor {
    return _randomColor;
  }

  void generateRandomColor() {
    _randomColor = ColorService().generateRandomColor();
    notifyListeners();
  }

  List<RandomColor> _favoriteColors = [];
  void saveRandomColor(RandomColor color) {
    _favoriteColors.add(color);
    notifyListeners();
  }

  List<RandomColor> get getFavoriteColors {
    return _favoriteColors;
  }
}
