// lib/widgets/sidebar.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/modules/auth/bloc/auth_bloc.dart';
import 'package:lotus/src/modules/home/widgets/sidebar_header.dart';
import 'package:lotus_ui/lotus_ui.dart';
import 'package:sidebarx/sidebarx.dart';

/// Sidebar controller.
class MySideBarController extends SidebarXController {
  /// Sidebar controller.
  MySideBarController() : super(selectedIndex: 0);
}

/// Sidebar widget.
class Sidebar extends StatelessWidget {
  /// Sidebar widget.
  const Sidebar({
    required this.controller,
    super.key,
  });
  // Moved static items outside the class to prevent them from being recreated.
  static final List<_SidebarItem> _items = [
    _SidebarItem(
      icon: HugeIcons.strokeRoundedDashboardSquare01,
      label: 'Dashboard',
      route: '/dashboard/',
    ),
    _SidebarItem(
      icon: Icons.computer_outlined,
      label: 'Computadores',
      route: '/computadores/',
    ),
    _SidebarItem(
      icon: HugeIcons.strokeRoundedPrinter,
      label: 'Impressoras',
      route: '/impressoras/',
    ),
    _SidebarItem(
      icon: HugeIcons.strokeRoundedTv02,
      label: 'Monitores',
      route: '/monitores/',
    ),
  ];
  static final List<_SidebarItem> _footerItems = [
    _SidebarItem(
      icon: HugeIcons.strokeRoundedSettings03,
      label: 'Settings',
      route: '/settings/',
    ),
  ];

  /// The controller of the sidebar.
  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final sidebarXThemeExtension =
        Theme.of(context).extension<SidebarXThemeExtension>();

    return RepaintBoundary(
      child: BlocConsumer<AuthBloc, AuthState>(
        bloc: Modular.get(),
        listener: (context, state) {
          if (state.isAdmin) {
            _footerItems.insert(
              0,
              _SidebarItem(
                icon: HugeIcons.strokeRoundedValidationApproval,
                label: 'Pendentes',
                route: '/computadores/pendentes',
              ),
            );
          } else {
            _footerItems.removeWhere(
              (element) => element.route == '/computadores/pendentes',
            );
          }
        },
        buildWhen: (previous, current) {
          return previous.isAdmin != current.isAdmin;
        },
        builder: (context, state) {
          return SidebarX(
            controller: controller,
            theme: sidebarXThemeExtension!.sidebarXTheme,
            extendedTheme: sidebarXThemeExtension.extendedSidebarXTheme,
            footerDivider: const Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
            headerBuilder: (context, extended) {
              return SidebarHeader(
                controller: controller,
                context: context,
                extended: extended,
              );
            },
            items: _items,
            footerItems: _footerItems,
            footerFitType: FooterFitType.fit,
            toggleButtonBuilder: (context, extended) {
              return const SizedBox(
                height: 10,
              );
            },
          );
        },
      ),
    );
  }
}

class _SidebarItem extends SidebarXItem {
  _SidebarItem({
    required this.route,
    super.icon,
    super.label,
  });
  final String route;

  @override
  void Function() get onTap => _onTap;

  void _onTap() {
    // Navigate only if the route is different
    // to prevent unnecessary rebuilds.
    if (Modular.to.path != route) {
      Modular.to.navigate(route);
    }
  }
}
