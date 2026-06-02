import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorSchemeSeed: const Color.fromARGB(255, 79, 220, 227),
  useMaterial3: true,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorSchemeSeed: const Color.fromARGB(255, 13, 11, 120),
  useMaterial3: true,
);
