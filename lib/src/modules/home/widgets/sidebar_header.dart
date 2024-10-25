// lib/widgets/sidebar.dart

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lotus/src/lotus_icon.dart';
import 'package:lotus_ui/lotus_ui.dart';
import 'package:sidebarx/sidebarx.dart';

/// {@template sidebar_header}
/// The header of the sidebar.
/// {@endtemplate}
class SidebarHeader extends StatelessWidget {
  /// {@macro sidebar_header}
  const SidebarHeader({
    required this.controller,
    required this.context,
    required this.extended,
    super.key,
  });

  /// The controller of the sidebar.
  final SidebarXController controller;

  /// The context of the widget.
  final BuildContext context;

  /// Whether the sidebar is extended.
  final bool extended;

  MaterialColor get _primaryColor {
    final primaryColor = ColorExtension(Theme.of(context).colorScheme.primary)
        .materialColor
        .shade50;
    return ColorExtension(primaryColor).materialColor;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: controller.toggleExtended,
      splashFactory: NoSplash.splashFactory,
      hoverColor: _primaryColor.shade50,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          // color: _primaryColor.shade50,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor.withOpacity(.5),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: const LotusIcon()
                    .animate(
                      target: extended ? 1 : 0,
                    )
                    .slideY(begin: .3, end: 0),
              ),
              const SizedBox(height: 10),
              const Text(
                'Project Lotus',
                style: TextStyle(
                  fontSize: 24,
                  // color: _primaryColor.shade900,
                ),
                softWrap: false,
                maxLines: 1,
              )
                  .animate(
                    target: extended ? 1 : 0,
                  )
                  .fadeIn(duration: 300.ms)
                  .slideY(begin: 2, end: 0)
                  .scale(
                    begin: const Offset(0.5, 0.5),
                    end: const Offset(1, 1),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
