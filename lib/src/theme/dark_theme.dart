// lib/themes/theme_dark.dart
import 'package:flutter/material.dart';
import 'package:lotus/src/constants/colors.dart';
import 'package:lotus/src/theme/sidebar_theme_extension.dart';
import 'package:sidebarx/sidebarx.dart';

/// The dark theme of the application.
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: azulInstitucional,
  scaffoldBackgroundColor: darkBackground,
  colorScheme: const ColorScheme.dark(
    primary: azulInstitucional,
    secondary: azulCeu,
    error: vermelhoInstitucional,
    surface: Color(0xFF1E1E1E),
    onPrimary: branco,
    onSecondary: branco,
    onError: branco,
  ),
  extensions: [
    SidebarXThemeExtension(
      sidebarXTheme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: azulInstitucional
              .withOpacity(0.15), // Fundo azul claro com transparência
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(color: Colors.white),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: azulInstitucional.withOpacity(0.5),
          ),
          color: azulInstitucional,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 30,
            ),
          ],
        ),
        iconTheme: const IconThemeData(
          color: branco,
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 24,
        ),
        selectedItemPadding: const EdgeInsets.all(6),
        itemPadding: const EdgeInsets.all(10),
        selectedItemMargin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        hoverTextStyle: const TextStyle(color: azulCeu),
        itemMargin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
      ),
      extendedSidebarXTheme: const SidebarXTheme(
        width: 250,
        margin: EdgeInsets.all(10),
      ),
    ),
  ],
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent, // Fundo transparente
    elevation: 0, // Remove a sombra padrão
    titleTextStyle: TextStyle(
      color: branco,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: branco),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Color(0xFFC0BDC6),
    ),
  ),
);
