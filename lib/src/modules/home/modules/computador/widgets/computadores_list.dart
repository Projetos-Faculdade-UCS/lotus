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
    return StreamBuilder<List<Ativo>>(
      stream: computadores,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final computadores = snapshot.data!;

          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              mainAxisExtent: 170,
              crossAxisSpacing: 10,
            ),
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
