import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:repositories/repositories.dart';

/// {@template computadores_list}
/// Lista de computadores.
/// {@endtemplate}
class ComputadoresList extends StatelessWidget {
  /// {@macro computadores_list}
  const ComputadoresList({
    required this.computadores,
    super.key,
  });

  /// Lista de computadores.
  final Stream<List<Ativo>> computadores;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: computadores,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final computadores = snapshot.data!;
          return ListView.builder(
            itemCount: computadores.length,
            itemBuilder: (context, index) {
              final computador = computadores[index];
              return AtivoCard(
                ativo: computador,
              );
            },
          );
        } else {
          return const Center(
            child: Text('Nenhum computador encontrado.'),
          );
        }
      },
    );
  }
}
