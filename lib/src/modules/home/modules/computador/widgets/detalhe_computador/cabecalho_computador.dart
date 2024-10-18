import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/computador_badges.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/ativos_relacionados_dialog.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/info_tile.dart';
import 'package:repositories/repositories.dart';

class CabecalhoComputador extends StatelessWidget {
  const CabecalhoComputador({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ListTile(
          leading: TipoAtivoIcone(
            tipo: TipoAtivo.computador,
          ),
          title: Text(
            'Computador Dell 2023',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: ComputadorBadges(),
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
              value: const Text(
                'João da Silva',
                style: TextStyle(
                  fontSize: 16,
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
                      '1',
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
