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
  final List<Ativo> ativos;

  static const _maxCardSize = 570.0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: _maxCardSize,
        mainAxisSpacing: 10,
        mainAxisExtent: 170,
        crossAxisSpacing: 10,
      ),
      itemCount: ativos.length,
      itemBuilder: (context, index) {
        final ativo = ativos[index];
        return AtivoCard(
          ativo: ativo,
          onTap: () {
            Navigator.of(context).pushNamed(
              '${ativo.tipo.route}/${ativo.id}',
            );
          },
        );
      },
    );
  }
}
