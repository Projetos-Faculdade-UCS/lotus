import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/computador_badges.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/ativos_relacionados_dialog.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/info_tile.dart';
import 'package:repositories/repositories.dart';

/// {@template cabecalho_computador}
/// Cabeçalho de um computador.
/// {@endtemplate}
class CabecalhoComputador extends StatelessWidget {
  /// {@macro cabecalho_computador}
  const CabecalhoComputador({
    required this.computadorNome,
    required this.computadorResponsavel,
    required this.computadorRelacionamentos,
    required this.computadorAutomatico,
    required this.computadorCriticidade,
    super.key,
  });

  /// O nome do computador.
  final String computadorNome;

  /// O responsável pelo computador.
  final String computadorResponsavel;

  /// A quantidade de ativos relacionados ao computador.
  final int computadorRelacionamentos;

  /// Indica se o computador é automático.
  final bool computadorAutomatico;

  /// A criticidade dos dados do computador.
  final CriticidadeDados computadorCriticidade;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: const TipoAtivoIcone(
            tipo: TipoAtivo.computador,
          ),
          title: Text(
            computadorNome,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: ComputadorBadges(
            isAutomatico: computadorAutomatico,
            criticidade: computadorCriticidade,
          ),
          //padding
          contentPadding: EdgeInsets.zero,
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InfoTile(
              width: 200,
              title: 'Responsável',
              value: Text(
                computadorResponsavel,
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
            const SizedBox(width: 32),
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
                      computadorRelacionamentos.toString(),
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
