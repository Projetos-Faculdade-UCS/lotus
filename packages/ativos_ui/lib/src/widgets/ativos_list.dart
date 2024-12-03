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
    required this.tipoAtivo,
    super.key,
  });

  /// Lista de computadores.
  final List<Ativo> ativos;

  /// Tipo de ativo.
  final TipoAtivo tipoAtivo;

  static const _maxCardSize = 570.0;

  @override
  Widget build(BuildContext context) {
    if (ativos.isEmpty) {
      return _EmptyList(
        tipoAtivo: tipoAtivo,
      );
    }

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

class _EmptyList extends StatelessWidget {
  const _EmptyList({
    required this.tipoAtivo,
  });

  final TipoAtivo tipoAtivo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Nenhum ${tipoAtivo.name.toLowerCase()} encontrado.',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
