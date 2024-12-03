import 'package:ativos_ui/ativos_ui.dart';
import 'package:ativos_ui/src/widgets/ativos_relacionados_dialog.dart';
import 'package:ativos_ui/src/widgets/info_tile.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:repositories/repositories.dart';

/// {@template cabecalho_computador}
/// Cabeçalho de um computador.
/// {@endtemplate}
class CabecalhoAtivo extends StatelessWidget {
  /// {@macro cabecalho_computador}
  const CabecalhoAtivo({
    required this.ativo,
    this.subtitle,
    super.key,
  });

  /// Objeto de ativo
  final Ativo ativo;

  /// O subtítulo do computador.
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: TipoAtivoIcone(
            tipo: ativo.tipo,
          ),
          title: Text(
            ativo.nome == '' ? 'Sem nome' : ativo.nome,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: subtitle,
          //padding
          contentPadding: EdgeInsets.zero,
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InfoTile(
              width: 200,
              title: 'Patrimônio',
              value: Text(
                '#${ativo.patrimonio}',
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.onSurface,
                ),
              ),
              leading: HugeIcon(
                icon: HugeIcons.strokeRoundedTag01,
                color: colorScheme.primary,
                size: 25,
              ),
            ),
            InfoTile(
              width: 200,
              title: 'Responsável',
              value: Text(
                ativo.responsavel == '' ? 'Nenhum' : ativo.responsavel,
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.onSurface,
                ),
              ),
              leading: HugeIcon(
                icon: HugeIcons.strokeRoundedUser,
                color: colorScheme.primary,
                size: 25,
              ),
            ),
            InfoTile(
              width: 200,
              title: 'Ativos relacionados',
              value: TextButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) =>
                      const AtivosRelacionadosDialog(),
                ),
                child: Row(
                  children: [
                    Text(
                      ativo.relacionamentos.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 8),
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedLinkSquare02,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 16,
                    ),
                  ],
                ),
              ),
              leading: HugeIcon(
                icon: HugeIcons.strokeRoundedWorkflowSquare06,
                color: colorScheme.primary,
                size: 25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
