
import 'package:flutter/material.dart';

const Color _customColor = Color(0XFF5C11D4);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.orange,
  Colors.pink,
  Colors.amber,
];

class AppTheme{

  final int selectedColor;

  AppTheme({
    required this.selectedColor
  }): assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'The selectedColor must be between 0 and ${_colorThemes.length}.');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}