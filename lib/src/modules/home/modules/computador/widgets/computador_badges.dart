import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/tipo_criticidade_badge.dart';
import 'package:repositories/repositories.dart';

/// {@template computador_badges}
/// Widget que exibe os badges de um computador.
/// {@endtemplate}
class ComputadorBadges extends StatelessWidget {
  /// {@macro computador_badges}
  const ComputadorBadges({
    required this.isAutomatico,
    required this.criticidade,
    super.key,
  });

  /// Indica se o computador é automático.
  // TODO(marhaubrich): Mudar o nome da propriedade para `automatico`.
  final bool isAutomatico;

  /// A criticidade dos dados do computador.
  final CriticidadeDados criticidade;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isAutomatico)
          CustomBadge(
            label: const Text('Automático'),
            backgroundColor: Theme.of(context).colorScheme.primary,
            borderColor: Theme.of(context).colorScheme.primary,
          ),
        const SizedBox(width: 8),
        TipoCriticidadeBadge(
          criticidade: criticidade,
        ),
      ],
    );
  }
}
