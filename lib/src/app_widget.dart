import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/theme/dark_theme.dart';
import 'package:lotus/src/theme/light_theme.dart';

/// The main widget of the application.
class AppWidget extends StatelessWidget {
  /// The main widget of the application.
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (light, dark) {
        return MaterialApp.router(
          title: 'Lotus',
          color: Colors.transparent,
          theme: light,
          darkTheme: dark,
          routerConfig: Modular.routerConfig,
          debugShowCheckedModeBanner: false,
          locale: const Locale('pt'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt'),
          ],
        );
      },
    );
  }
}
