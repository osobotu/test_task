import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_app/models/random_color.dart';

class ColorService {
  RandomColor generateRandomColor() {
    final Random _random = Random();
    final color = Color.fromRGBO(
      _random.nextInt(255),
      _random.nextInt(255),
      _random.nextInt(255),
      _random.nextDouble(),
    );
    return RandomColor(color: color);
  }
}
