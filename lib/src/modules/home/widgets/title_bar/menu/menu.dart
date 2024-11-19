import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/lotus_icon.dart';
import 'package:lotus/src/modules/auth/bloc/auth_bloc.dart';
import 'package:lotus/src/modules/auth/widgets/admin_login_dialog.dart';

/// {@template menu}
/// A widget that represents a menu.
/// {@endtemplate}
class Menu extends StatefulWidget {
  /// Default constructor.
  const Menu({
    required this.position,
    super.key,
  });

  /// The position of the menu.
  final Offset position;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final year = DateTime.now().year;
  bool get isAdmin => Modular.get<AuthBloc>().state.isAdmin;

  List<ContextMenuEntry> get entries => <ContextMenuEntry>[
        MenuItem<void>(
          label: isAdmin ? 'Desativar admin' : 'Ativar admin',
          icon: HugeIcons.strokeRoundedShield02,
          onSelected: () {
            if (isAdmin) {
              Modular.get<AuthBloc>().add(const Logout());
              return;
            }

            Modular.to.push<void>(
              PageRouteBuilder<void>(
                fullscreenDialog: true,
                opaque: false,
                barrierColor: Colors.black38,
                barrierDismissible: true,
                barrierLabel: 'search-modal',
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                settings: const RouteSettings(
                  name: 'search-modal',
                ),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return AdminLoginDialog(
                    onConfirm: () {
                      Modular.get<AuthBloc>().add(const Login());
                    },
                  );
                },
              ),
            );
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const red700 = Color(0xffc3362b);
    const red300 = Color(0xfff6695e);
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: Modular.get(),
      builder: (context, state) {
        return AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          crossFadeState: state.isAdmin
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                red700,
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            icon: const Icon(
              HugeIcons.strokeRoundedShield02,
              color: Colors.white,
            ),
            hoverColor: red300,
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            onPressed: () {
              showContextMenu<void>(
                context,
                contextMenu: ContextMenu(
                  entries: entries,
                  position: const Offset(0, 36),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  boxDecoration: BoxDecoration(
                    color: theme.canvasColor,
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadowColor.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                maintainState: true,
              );
            },
          ),
          secondChild: IconButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            icon: Icon(
              HugeIcons.strokeRoundedMenu04,
              color: theme.iconTheme.color,
            ),
            hoverColor: Colors.grey.withOpacity(0.5),
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            onPressed: () {
              showContextMenu<void>(
                context,
                contextMenu: ContextMenu(
                  entries: entries,
                  position: const Offset(0, 36),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  boxDecoration: BoxDecoration(
                    color: theme.canvasColor,
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadowColor.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                maintainState: true,
              );
            },
          ),
          // child: IconButton(
          //   style: ButtonStyle(
          //     backgroundColor: state.isAdmin
          //         ? WidgetStateProperty.all<Color>(
          //             Colors.red.withOpacity(0.7),
          //           )
          //         : null,
          //     shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          //       RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(0),
          //       ),
          //     ),
          //   ),
          //   icon: Icon(
          //     state.isAdmin
          //         ? HugeIcons.strokeRoundedShield02
          //         : HugeIcons.strokeRoundedMenu04,
          //     color: state.isAdmin ? Colors.white : theme.iconTheme.color,
          //   ),
          //   hoverColor: Colors.grey.withOpacity(0.5),
          //   alignment: Alignment.center,
          //   padding: EdgeInsets.zero,
          //   onPressed: () {
          //     showContextMenu<void>(
          //       context,
          //       contextMenu: ContextMenu(
          //         entries: entries,
          //         position: const Offset(0, 36),
          //         borderRadius: const BorderRadius.only(
          //           bottomLeft: Radius.circular(8),
          //           bottomRight: Radius.circular(8),
          //         ),
          //         boxDecoration: BoxDecoration(
          //           color: theme.canvasColor,
          //           boxShadow: [
          //             BoxShadow(
          //               color: theme.shadowColor.withOpacity(0.3),
          //               blurRadius: 4,
          //               offset: const Offset(0, 4),
          //             ),
          //           ],
          //         ),
          //       ),
          //       maintainState: true,
          //     );
          //   },
          // ),
        );
      },
    );
  }
}
