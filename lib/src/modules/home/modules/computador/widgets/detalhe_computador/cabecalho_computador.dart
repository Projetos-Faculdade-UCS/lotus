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
          children: [
            const InfoTile(
              title: 'Responsável',
              value: Text(
                'João da Silva',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              icon: HugeIcons.strokeRoundedUser,
            ),
            const SizedBox(width: 32),
            InfoTile(
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
              icon: HugeIcons.strokeRoundedWorkflowSquare06,
            ),
          ],
        ),
      ],
    );
  }
}
