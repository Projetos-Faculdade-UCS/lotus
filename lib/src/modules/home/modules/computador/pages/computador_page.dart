import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/tipo_criticidade_badge.dart';
import 'package:lotus_ui/lotus_ui.dart';
import 'package:repositories/repositories.dart';

class ComputadorPage extends StatelessWidget {
  const ComputadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Miolo(
      child: Padding(
        // 40 on x 24 on y
        padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
        child: Column(
          children: [
            Row(
              children: [
                const TipoAtivoIcone(
                  tipo: TipoAtivo.computador,
                  size: 72,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Intel Core i7 10ª Geração',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        CustomBadge(
                          label: const Text('Automático'),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          borderColor: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        const TipoCriticidadeBadge(
                          criticidade: TipoCriticidade.media,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Text('Right-click me!'),
          ],
        ),
      ),
    );
  }
}
