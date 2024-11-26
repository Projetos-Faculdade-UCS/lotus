import 'package:flutter/material.dart';

/// Dialog para alterar a localização de um ativo.
class MudarLocalDialog extends StatelessWidget {
  /// {@macro mudar_local_dialog}
  const MudarLocalDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text('Mudar local'),
      ),
    );
  }
}
