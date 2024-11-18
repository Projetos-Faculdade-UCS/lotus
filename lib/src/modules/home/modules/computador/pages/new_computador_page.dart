import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/widgets/breadcrumb/miolo_with_breadcrumb.dart';

/// {@template new_computador_page}
/// Página de cadastro de computador.
/// {@endtemplate}
class NewComputadorPage extends StatelessWidget {
  /// {@macro new_computador_page}
  const NewComputadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MioloWithBreadcrumb(
      child: Center(
        child: Text('Página de cadastro de computador.'),
      ),
    );
  }
}
