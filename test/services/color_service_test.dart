import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/services/color_service.dart';

void main() {
  var colorService = ColorService();
  test('Random colors should be generated', () {
    var randomColor = colorService.generateRandomColor();
    var anotherRandomColor = colorService.generateRandomColor();
    expect(randomColor == anotherRandomColor, false);
  });
}
