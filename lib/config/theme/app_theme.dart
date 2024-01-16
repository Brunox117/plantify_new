import 'package:flutter/material.dart';

const seedColor = Color.fromARGB(255, 77, 184, 55);

class AppTheme {
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false});

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      brightness: isDarkMode ? Brightness.dark : Brightness.light);

  AppTheme copyWith({bool? isDarkMode}) =>
      AppTheme(isDarkMode: isDarkMode ?? this.isDarkMode);
}