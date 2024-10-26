import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/widgets/breadcrumb/miolo_with_breadcrumb.dart';

/// {@template impressora_page}
/// A impressora page.
/// {@endtemplate}
class ImpressoraPage extends StatelessWidget {
  /// {@macro impressora_page}
  const ImpressoraPage({
    required this.id,
    super.key,
  });

  /// ID da impressora.
  final int id;

  @override
  Widget build(BuildContext context) {
    return MioloWithBreadcrumb(
      child: Center(
        child: Text('Impressora $id'),
      ),
    );
  }
}
