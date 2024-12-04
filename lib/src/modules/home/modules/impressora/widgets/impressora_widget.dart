import 'package:ativos_ui/src/widgets/cabecalho_ativo.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/modules/home/modules/impressora/bloc/impressoras_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/movimentacao_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/card_local.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/lista_movimentacoes.dart';
import 'package:repositories/repositories.dart';

/// Tela de detalhes de uma impressora.
class ImpressoraWidget extends StatelessWidget {
  /// {@macro impressora_widget}
  const ImpressoraWidget({
    required this.impressora,
    required this.impressorasBloc,
    super.key,
  });

  /// Impressora.
  final Impressora impressora;

  /// Bloc da impressora.
  final ImpressorasBloc impressorasBloc;

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
              border: Border(
                bottom: BorderSide(
                  color: colorScheme.onSurfaceVariant,
                  width: 0.5,
                ),
              ),
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
              ativo: impressora,
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
                          sala: impressora.sala,
                          onUpdateSala: (sala) {
                            impressorasBloc.add(
                              UpdateSala(
                                id: impressora.id,
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
                            idAtivo: impressora.id,
                            bloc: Modular.get<MovimentacaoBloc>(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
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
                        const Expanded(
                          child: Placeholder(),
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
