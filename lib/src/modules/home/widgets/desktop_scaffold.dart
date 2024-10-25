import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/widgets/sidebar.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/title_bar.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:window_manager/window_manager.dart';

/// A scaffold with a sidebar.
class DesktopScaffold extends StatelessWidget {
  /// A scaffold with a sidebar.
  const DesktopScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return DragToResizeArea(
      child: Scaffold(
        body: LayoutGrid(
          areas: '''
                  titlebar titlebar
                  sidebar content
                ''',
          columnSizes: [auto, 1.fr],
          rowSizes: [auto, 1.fr],
          columnGap: 0,
          rowGap: 0,
          children: [
            // Title bar in its own area
            const TitleBar().inGridArea('titlebar'),
            // Sidebar in its own area
            const SidebarWidget().inGridArea('sidebar'),
            // Main content area
            const RouterOutlet().inGridArea('content'),
          ],
        ),
      ),
    );
  }
}

/// {@template sidebar_widget}
/// Sidebar widget separated to localize state changes.
/// {@endtemplate}
class SidebarWidget extends StatefulWidget {
  /// {@macro sidebar_widget}
  const SidebarWidget({super.key});

  @override
  State<SidebarWidget> createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {
  late final SidebarXController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Modular.get<SidebarXController>();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Sidebar(
        controller: _controller,
      ),
    );
  }
}
