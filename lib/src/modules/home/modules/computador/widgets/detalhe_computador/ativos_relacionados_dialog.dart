import 'package:flutter/material.dart';

/// {@template ativos_relacionados_dialog}
/// Diálogo que exibe os ativos relacionados a um computador.
/// {@endtemplate}
class AtivosRelacionadosDialog extends StatelessWidget {
  /// {@macro ativos_relacionados_dialog}
  const AtivosRelacionadosDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ativos relacionados',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('Monitor 1'),
              subtitle: Text('Monitor 1'),
            ),
            ListTile(
              title: Text('Teclado 1'),
              subtitle: Text('Teclado 1'),
            ),
            ListTile(
              title: Text('Mouse 1'),
              subtitle: Text('Mouse 1'),
            ),
          ],
        ),
      ),
    );
  }
}
