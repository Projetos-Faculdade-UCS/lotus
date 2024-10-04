import 'package:flutter/material.dart';

/// Helper function to generate a MaterialColor from a single color
MaterialColor createMaterialColor(Color color) {
  final strengths = <double>[.05];
  final swatch = <int, Color>{};
  final r = color.red;
  final g = color.green;
  final b = color.blue;

  for (var i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (final strength in strengths) {
    final ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

/// Material Color for Azul Institucional
const azulInstitucional = Color(0xFF004FE1);

/// Material Color for Azul Céu
const azulCeu = Color(0xFF009BDF);

/// Material Color for Cinza Claro
const tertiary = Color(0xFFF5F5F5);

/// Material Color for Branco
const branco = Color(0xFFFFFFFF);

/// Material Color for Vermelho Institucional
const vermelhoInstitucional = Color(0xFFEE3244);

/// Material Color for Dark Gray Background
const darkBackground = Color(0xFF121212);

/// Text color for dark theme
const darkBodyText = Color(0xFFE0E0E0);

/// Material color for light theme
const lightBodyText = Color(0xFF1D192B);
