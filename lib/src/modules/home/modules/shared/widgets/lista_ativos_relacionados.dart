import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:repositories/repositories.dart';

/// Lista de ativos relacionados a um ativo pai.
class ListaAtivosRelacionados extends StatelessWidget {
  /// Lista de ativos relacionados a um ativo pai.
  const ListaAtivosRelacionados({
    required this.ativos,
    required this.tipoAtivoPai,
    super.key,
  });

  /// Lista de ativos relacionados.
  final List<Ativo> ativos;

  /// Tipo do ativo pai.
  final TipoAtivo tipoAtivoPai;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final monitores =
        ativos.where((element) => element.tipo == TipoAtivo.monitor);
    final impressoras =
        ativos.where((element) => element.tipo == TipoAtivo.impressora);
    final computadores =
        ativos.where((element) => element.tipo == TipoAtivo.computador);

    return Expanded(
      child: ListView(
        children: [
          if (computadores.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              '${computadores.length} Computador${computadores.length > 1 ? 'es' : ''}',
              style: TextStyle(
                fontSize: 16,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            for (final computador in computadores) AtivoCard(ativo: computador),
          ],
          if (monitores.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              '${monitores.length} Monitor${monitores.length > 1 ? 'es' : ''}',
              style: TextStyle(
                fontSize: 16,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            for (final monitor in monitores) AtivoCard(ativo: monitor),
          ],
          if (impressoras.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              '${impressoras.length} Impressora${impressoras.length > 1 ? 's' : ''}',
              style: TextStyle(
                fontSize: 16,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            for (final impressora in impressoras) AtivoCard(ativo: impressora),
          ],
          if (ativos.isEmpty)
            SizedBox(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    HugeIcons.strokeRoundedNodeRemove,
                    size: 48,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Nenhum ativo relacionado encontrado.',
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
