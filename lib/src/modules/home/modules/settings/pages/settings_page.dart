import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/controllers/menu_bar_controller.dart';
import 'package:lotus_ui/lotus_ui.dart';

/// The Settings page of the application.
class SettingsPage extends StatelessWidget {
  /// Creates the Settings page.
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Miolo(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      child: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: Modular.get<MenuBarController>().isToggled,
            builder: (context, value, child) {
              return SwitchListTile(
                value: value,
                onChanged: (value) {
                  Modular.get<MenuBarController>().toggle();
                },
                title: const Text(
                  'Show Menu Bar',
                ),
                subtitle: const Text(
                  'Show or hide the menu bar.',
                ),
              );
            },
          ),
          ListenableBuilder(
            listenable: AdaptiveTheme.of(context).modeChangeNotifier,
            builder: (context, snapshot) {
              return ListTile(
                title: const Text(
                  'Theme',
                  style: TextStyle(),
                ),
                trailing: DropdownButton<AdaptiveThemeMode>(
                  focusColor: Colors.transparent,
                  value: AdaptiveTheme.of(context).mode,
                  onChanged: (value) {
                    Future.microtask(() {
                      if (context.mounted) {
                        AdaptiveTheme.of(context).setThemeMode(
                          value ?? AdaptiveThemeMode.system,
                        );
                      }
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: AdaptiveThemeMode.system,
                      child: Text('System'),
                    ),
                    DropdownMenuItem(
                      value: AdaptiveThemeMode.light,
                      child: Text('Light'),
                    ),
                    DropdownMenuItem(
                      value: AdaptiveThemeMode.dark,
                      child: Text('Dark'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
