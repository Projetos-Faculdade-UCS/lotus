import 'package:ativos_ui/src/widgets/cabecalho_ativo.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/modules/home/modules/computador/bloc/computador/computador_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/computador_badges.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/ficha_tecnica_tabs.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/movimentacao_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/card_local.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/lista_movimentacoes.dart';
import 'package:repositories/repositories.dart';

/// Componente que exibe detalhes de um [Computador].
class ComputadorWidget extends StatelessWidget {
  /// Cria uma instância de [ComputadorWidget].
  const ComputadorWidget({
    required this.computador,
    required this.computadorBloc,
    super.key,
  });

  /// Computador a ser exibido.
  final Computador computador;

  final ComputadorBloc computadorBloc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return ColoredBox(
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
                  offset: const Offset(
                    0,
                    -4,
                  ),
                  inset: true,
                  blurRadius: 4,
                ),
              ],
            ),
            child: CabecalhoAtivo(
              ativo: computador,
              subtitle: ComputadorBadges(
                isAutomatico: computador.automatico,
                criticidade: computador.criticidade,
              ),
            ),
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
                        CardLocal(
                          sala: computador.sala,
                          onUpdateSala: (sala) {
                            computadorBloc.add(
                              UpdateSala(
                                id: computador.id,
                                sala: sala,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            HugeIcon(
                              icon: HugeIcons.strokeRoundedClock04,
                              color: colorScheme.onSurfaceVariant,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                'Histórico de movimentações',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListaMovimentacoes(
                            idAtivo: computador.id,
                            bloc: Modular.get<MovimentacaoBloc>(),
                          ),
                        ),
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
                        Flexible(
                          child: FichaTecnicaTabs(
                            computador: computador,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
