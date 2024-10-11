import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/tipo_criticidade_badge.dart';
import 'package:repositories/repositories.dart';

class ComputadorBadges extends StatelessWidget {
  const ComputadorBadges({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomBadge(
          label: const Text('Automático'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          borderColor: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 8),
        const TipoCriticidadeBadge(
          criticidade: CriticidadeDados.media,
        ),
      ],
    );
  }
}
