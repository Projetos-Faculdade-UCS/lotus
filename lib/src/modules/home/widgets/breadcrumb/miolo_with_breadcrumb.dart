import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/widgets/modular_breadcrumb.dart';
import 'package:lotus_ui/lotus_ui.dart';

/// {@template miolo_with_breadcrumb}
/// A miolo with breadcrumb widget.
/// {@endtemplate}
class MioloWithBreadcrumb extends StatelessWidget {
  /// {@macro miolo_with_breadcrumb}
  const MioloWithBreadcrumb({
    required this.child,
    this.title,
    this.actions,
    super.key,
  });

  /// The child of the widget.
  final Widget child;

  /// The title of the widget.
  final String? title;

  /// {@macro flutter.material.appbar.actions}
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Miolo(
      appBar: AppBar(
        title: const ModularBreadcrumb(),
        centerTitle: true,
        scrolledUnderElevation: 0,
        actions: actions,
      ),
      child: child,
    );
  }
}
