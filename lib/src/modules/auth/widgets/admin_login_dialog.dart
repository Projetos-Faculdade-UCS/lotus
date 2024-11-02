import 'package:flutter/material.dart';

/// {@template admin_login_dialog}
/// A dialog that prompts the user to enable admin mode.
/// {@endtemplate}
class AdminLoginDialog extends StatelessWidget {
  /// {@macro admin_login_dialog}
  const AdminLoginDialog({required this.onConfirm, super.key});

  /// A callback that is called when the user confirms the dialog.
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ativar modo administrador'),
      content: const Text('Deseja ativar o modo administrador?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop();
          },
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
