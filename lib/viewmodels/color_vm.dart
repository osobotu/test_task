import 'package:flutter/material.dart';

import 'package:test_app/services/color_service.dart';

class ColorViewModel extends ChangeNotifier {
  Color _randomColor = ColorService().generateRandomColor();

  Color get getRandomColor {
    return _randomColor;
  }

  void generateRandomColor() {
    _randomColor = ColorService().generateRandomColor();
    notifyListeners();
  }

  final List<Color> _favoriteColors = [];

  List<Color> get getFavoriteColors {
    return _favoriteColors;
  }

  void add(Color color) {
    _favoriteColors.add(color);
    notifyListeners();
  }

  void remove(Color color) {
    _favoriteColors.remove(color);
    notifyListeners();
  }
}
