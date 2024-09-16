// lib/themes/theme_light.dart
import 'package:flutter/material.dart';
import 'package:lotus/src/constants/colors.dart';
import 'package:lotus/src/theme/sidebar_theme_extension.dart';
import 'package:sidebarx/sidebarx.dart';

/// The light theme of the application.
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: azulInstitucional,
  scaffoldBackgroundColor: branco,
  colorScheme: const ColorScheme.light(
    primary: azulInstitucional,
    secondary: azulCeu,
    error: vermelhoInstitucional,
    onSecondary: branco,
  ),
  extensions: [
    SidebarXThemeExtension(
      sidebarXTheme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        hoverColor: azulInstitucional.withOpacity(0.2),
        decoration: BoxDecoration(
          color: azulInstitucional
              .withOpacity(0.15), // Fundo azul claro com transparência
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(color: Colors.black),
        selectedTextStyle: const TextStyle(color: Colors.black),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: azulCeu.withOpacity(0.5),
          ),
          color: azulCeu,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 30,
            ),
          ],
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 24,
        ),
        selectedItemPadding: const EdgeInsets.all(6),
        selectedItemMargin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        itemMargin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        itemPadding: const EdgeInsets.all(10),
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
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.black),
  ),
);
