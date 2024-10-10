import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/tipo_criticidade_badge.dart';
import 'package:repositories/repositories.dart';

class ComputadorTitle extends StatelessWidget {
  const ComputadorTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Intel Core i7 10ª Geração',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Row(
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
        ),
      ],
    );
  }
}
