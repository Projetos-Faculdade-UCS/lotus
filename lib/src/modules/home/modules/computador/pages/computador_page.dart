import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/cabecalho_computador.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/card_local.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/ficha_tecnica_tabs.dart';
import 'package:lotus_ui/lotus_ui.dart';

class ComputadorPage extends StatelessWidget {
  const ComputadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Miolo(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: ColoredBox(
        color: colorScheme.surface,
        child: Column(
          children: [
            Container(
              // adiciona uma shadow apenas na parte inferior bg fica branco
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow,
                    blurRadius: 4,
                    offset: const Offset(
                      0,
                      1,
                    ), // Sombra apenas para baixo (eixo Y positivo)
                  ),
                  BoxShadow(
                    color: theme.scaffoldBackgroundColor,
                    offset: const Offset(
                      0,
                      -8,
                    ), // Sombra apenas para baixo (eixo Y positivo)
                  ),
                ],
              ),
              child: const CabecalhoComputador(),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              HugeIcon(
                                icon: HugeIcons.strokeRoundedMapsLocation01,
                                color: colorScheme.onSurfaceVariant,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Local atual',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const CardLocal(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              HugeIcon(
                                icon: HugeIcons.strokeRoundedTask01,
                                color: colorScheme.onSurfaceVariant,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Ficha técnica',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const FichaTecnicaTabs(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
