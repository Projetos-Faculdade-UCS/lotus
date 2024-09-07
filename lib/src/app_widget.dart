import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// The main widget of the application.
class AppWidget extends StatelessWidget {
  /// The main widget of the application.
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(),
      dark: ThemeData.dark(),
      initial: AdaptiveThemeMode.system,
      builder: (light, dark) {
        return MaterialApp.router(
          title: 'Lotus',
          theme: light,
          darkTheme: dark,
          routerConfig: Modular.routerConfig,
        );
      },
    ); //added by extension
  }
}
