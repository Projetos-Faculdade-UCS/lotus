import 'package:ativos_ui/src/widgets/cabecalho_ativo.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/modules/home/modules/monitor_module/bloc/monitores_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/ativos_relacionados_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/movimentacao_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/ativos_relacionados_dialog.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/card_local.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/lista_movimentacoes.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/no_content.dart';
import 'package:repositories/repositories.dart';

/// Widget que exibe as informações de um monitor.
class MonitorWidget extends StatelessWidget {
  /// Cria um [MonitorWidget].
  const MonitorWidget({
    required this.monitor,
    required this.monitoresBloc,
    super.key,
  });

  /// O monitor que será exibido.
  final Monitor monitor;

  /// O bloc que gerencia os monitores.
  final MonitoresBloc monitoresBloc;

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
              border: Border(
                bottom: BorderSide(
                  color: colorScheme.onSurfaceVariant,
                  width: 0.5,
                ),
              ),
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
              ativo: monitor,
              onPressed: (ativo) {
                AtivosRelacionadosDialog.show(
                  Modular.get<AtivosRelacionadosBloc>(),
                  ativo,
                );
              },
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
                          sala: monitor.sala,
                          onUpdateSala: (sala) {
                            monitoresBloc.add(
                              UpdateSala(
                                id: monitor.id,
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
                            idAtivo: monitor.id,
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
                              icon: HugeIcons.strokeRoundedTask01,
                              color: colorScheme.onSurfaceVariant,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                'Ficha técnica',
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
                        Flexible(
                          child: SizedBox(
                            width: double.infinity,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: colorScheme.onSurfaceVariant,
                                  width: 0.5,
                                ),
                              ),
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: ListView(
                                  children: [
                                    if (monitor.descricao.isNotEmpty)
                                      ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        title: Text(
                                          'Descrição',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                        subtitle: Text(
                                          monitor.descricao,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: colorScheme.onSurface,
                                          ),
                                        ),
                                      )
                                    else
                                      const NoContent(text: 'Sem descrição'),
                                    if (monitor.resolucao.isNotEmpty)
                                      ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: const Icon(
                                          HugeIcons.strokeRoundedArrowDiagonal,
                                        ),
                                        title: Text(
                                          'Resolução',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                        subtitle: Text(
                                          monitor.resolucao,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: colorScheme.onSurface,
                                          ),
                                        ),
                                      )
                                    else
                                      const NoContent(text: 'Sem resolução'),
                                    if (monitor.fabricante.isNotEmpty)
                                      ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: const Icon(
                                          HugeIcons.strokeRoundedFactory02,
                                        ),
                                        title: Text(
                                          'Fabricante',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                        subtitle: Text(
                                          monitor.fabricante,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: colorScheme.onSurface,
                                          ),
                                        ),
                                      )
                                    else
                                      const NoContent(text: 'Sem fabricante'),
                                    if (monitor.numeroSerie?.isNotEmpty ??
                                        false)
                                      ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: const Icon(
                                          HugeIcons.strokeRoundedGrid,
                                        ),
                                        title: Text(
                                          'Número de série',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                        subtitle: Text(
                                          monitor.numeroSerie!,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: colorScheme.onSurface,
                                          ),
                                        ),
                                      )
                                    else
                                      const NoContent(
                                        text: 'Sem número de série',
                                      ),
                                  ],
                                ),
                              ),
                            ),
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
