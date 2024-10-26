import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/widgets/breadcrumb/miolo_with_breadcrumb.dart';

/// {@template monitor_page}
/// A monitor page.
/// {@endtemplate}
class MonitorPage extends StatelessWidget {
  /// {@macro monitor_page}
  const MonitorPage({
    required this.id,
    super.key,
  });

  /// ID do monitor.
  final int id;

  @override
  Widget build(BuildContext context) {
    return MioloWithBreadcrumb(
      child: Center(
        child: Text('Monitor $id'),
      ),
    );
  }
}
