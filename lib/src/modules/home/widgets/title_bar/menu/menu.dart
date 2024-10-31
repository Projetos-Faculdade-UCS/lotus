import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/lotus_icon.dart';

/// {@template menu}
/// A widget that represents a menu.
/// {@endtemplate}
class Menu extends StatefulWidget {
  /// Default constructor.
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // define your context menu entries
  List<ContextMenuEntry> get entries => <ContextMenuEntry>[
        MenuItem<void>(
          label: 'Ativar admin',
          icon: HugeIcons.strokeRoundedShield02,
          onSelected: () {
            debugPrint('Ativar admin');
          },
        ),
        MenuItem<void>(
          label: 'Mudar Tema',
          icon: HugeIcons.strokeRoundedMoon,
          onSelected: () {
            AdaptiveTheme.of(context).toggleThemeMode(useSystem: false);
          },
        ),
        MenuDivider(
          thickness: 1,
          height: 1,
          color: Theme.of(context).dividerColor.withOpacity(0.5),
        ),
        MenuItem<void>(
          label: 'Sobre',
          icon: HugeIcons.strokeRoundedInformationCircle,
          onSelected: () {
            showAboutDialog(
              context: context,
              applicationIcon: const SizedBox(
                width: 48,
                height: 48,
                child: LotusIcon(),
              ),
              applicationName: 'Lotus',
              applicationVersion: '1.0.0',
              applicationLegalese:
                  '© $year Universidade de Caxias do Sul. All rights reserved.',
            );
          },
        ),
      ];

  final year = DateTime.now().year;

  // initialize a context menu
  ContextMenu get menu => ContextMenu(
        entries: entries,
        position: const Offset(0, 36),
        // padding: const EdgeInsets.all(8),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        boxDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      icon: const Icon(
        HugeIcons.strokeRoundedMenu04,
      ),
      hoverColor: Colors.grey.withOpacity(0.5),
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      onPressed: () {
        showContextMenu<void>(
          context,
          contextMenu: menu,
          maintainState: true,
        );
      },
    );
  }
}
