import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/colors.dart';
import 'package:lotus/src/lotus_icon.dart';
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
      icon: Icons.dashboard,
      label: 'Dashboard',
      route: '/dashboard/',
    ),
    _SidebarItem(
      icon: Icons.shopping_cart,
      label: 'Shop',
      route: '/shop/',
    ),
    _SidebarItem(
      icon: Icons.icecream,
      label: 'Ice-Cream',
      route: '/ice-cream/',
    ),
    _SidebarItem(
      icon: Icons.search,
      label: 'Search',
      route: '/search/',
    ),
  ];

  static final List<_SidebarItem> _footerItems = [
    _SidebarItem(
      icon: Icons.settings,
      label: 'Settings',
      route: '/settings/',
    ),
  ];

  /// The controller of the sidebar.
  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SidebarX(
        controller: controller,
        theme: _sidebarTheme,
        extendedTheme: _extendedTheme,
        footerDivider: const Divider(
          color: Colors.white,
          thickness: 0.5,
        ),
        headerBuilder: _buildHeader,
        items: _items,
        footerItems: _footerItems,
        footerFitType: FooterFitType.fit,
        toggleButtonBuilder: (context, extended) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  }

  // Extracted themes to constants to prevent rebuilding them.
  static final SidebarXTheme _sidebarTheme = SidebarXTheme(
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: canvasColor,
      borderRadius: BorderRadius.circular(20),
    ),
    textStyle: const TextStyle(color: Colors.white),
    selectedTextStyle: const TextStyle(color: Colors.white),
    itemTextPadding: const EdgeInsets.only(left: 30),
    selectedItemTextPadding: const EdgeInsets.only(left: 30),
    itemDecoration: BoxDecoration(
      border: Border.all(color: canvasColor),
    ),
    selectedItemDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: actionColor.withOpacity(0.37),
      ),
      gradient: const LinearGradient(
        colors: [accentCanvasColor, canvasColor],
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26, // Reduced opacity for better performance.
          blurRadius: 30,
        ),
      ],
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 20,
    ),
  );

  static final SidebarXTheme _extendedTheme = SidebarXTheme(
    width: 250,
    decoration: BoxDecoration(
      color: canvasColor,
      borderRadius: BorderRadius.circular(20),
    ),
    margin: const EdgeInsets.all(10),
  );

  Widget _buildHeader(BuildContext context, bool extended) {
    return InkWell(
      onTap: controller.toggleExtended,
      child: DrawerHeader(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AnimatedRotation(
                duration: const Duration(milliseconds: 300),
                turns: extended ? 1 : 0,
                child: const LotusIcon(),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: SizedBox(
                height: extended ? 50 : 0,
                child: const Text(
                  'Project Lotus',
                  style: TextStyle(
                    color: white,
                    fontSize: 24,
                  ),
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
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

  void _onTap() {
    // Navigate only if the route is different
    // to prevent unnecessary rebuilds.
    if (Modular.to.path != route) {
      Modular.to.navigate(route);
    }
  }

  @override
  void Function() get onTap => _onTap;

  final String route;
}
