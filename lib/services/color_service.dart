import 'dart:math';

import 'package:flutter/material.dart';

class ColorService {
  Color generateRandomColor() {
    final Random _random = Random();
    final color = Color.fromRGBO(
      _random.nextInt(255),
      _random.nextInt(255),
      _random.nextInt(255),
      _random.nextDouble(),
    );
    return color;
  }
}
