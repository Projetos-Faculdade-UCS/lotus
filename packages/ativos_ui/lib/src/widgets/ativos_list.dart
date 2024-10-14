import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:repositories/repositories.dart';

/// {@template computadores_list}
/// Lista de computadores.
/// {@endtemplate}
class AtivosList extends StatelessWidget {
  /// {@macro computadores_list}
  const AtivosList({
    required this.ativos,
    super.key,
  });

  /// Lista de computadores.
  final Stream<List<Ativo>> ativos;

  static const _maxCardSize = 570.0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Ativo>>(
      stream: ativos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final computadores = snapshot.data!;

          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: _maxCardSize,
              mainAxisSpacing: 10,
              mainAxisExtent: 170,
              crossAxisSpacing: 10,
            ),
            itemCount: computadores.length,
            itemBuilder: (context, index) {
              final computador = computadores[index];
              return AtivoCard(
                ativo: computador,
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/computadores/${computador.id}',
                  );
                },
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
