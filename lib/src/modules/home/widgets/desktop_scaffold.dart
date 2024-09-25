import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/widgets/bottom_bar.dart';
import 'package:lotus/src/modules/home/widgets/sidebar.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/title_bar.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:window_manager/window_manager.dart';

/// A scaffold with a sidebar.
class DesktopScaffold extends StatefulWidget {
  /// A scaffold with a sidebar.
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  late final SidebarXController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Modular.get();
  }

  @override
  Widget build(BuildContext context) {
    return DragToResizeArea(
      child: Scaffold(
        body: Column(
          children: [
            const RepaintBoundary(child: TitleBar()),
            Expanded(
              child: Row(
                children: [
                  RepaintBoundary(
                    child: Sidebar(
                      controller: _controller,
                    ),
                  ),
                  const Expanded(
                    child: RouterOutlet(),
                  ),
                ],
              ),
            ),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
