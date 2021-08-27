import 'package:flutter/widgets.dart';
import 'package:test/test.dart';
import 'package:test_app/viewmodels/color_vm.dart';

void main() {
  group('Testing the ColorViewModel', () {
    var colorViewModel = ColorViewModel();

    test('A new color should be added', () {
      var color = Color.fromRGBO(111, 222, 255, 0.5);
      colorViewModel.add(color);
      expect(colorViewModel.getFavoriteColors.contains(color), true);
    });

    test('A specified color should be removed', () {
      var color = Color.fromRGBO(11, 22, 33, 0.5);
      colorViewModel.add(color);
      expect(colorViewModel.getFavoriteColors.contains(color), true);
      colorViewModel.remove(color);
      expect(colorViewModel.getFavoriteColors.contains(color), false);
    });
  });
}
