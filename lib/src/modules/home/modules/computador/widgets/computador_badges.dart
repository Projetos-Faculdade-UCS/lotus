import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/tipo_criticidade_badge.dart';
import 'package:repositories/repositories.dart';

class ComputadorBadges extends StatelessWidget {
  const ComputadorBadges({
    required this.isAutomatico,
    required this.criticidade,
    super.key,
  });

  final bool isAutomatico;
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
