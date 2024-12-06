import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/modules/auth/bloc/auth_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/sala_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/mudar_local_dialog.dart';
import 'package:repositories/repositories.dart';
import 'package:soft_edge_blur/soft_edge_blur.dart';

/// {@template card_local}
/// Card que exibe informações sobre a localização de um ativo.
/// {@endtemplate}
class CardLocal extends StatelessWidget {
  /// {@macro card_local}
  const CardLocal({
    required this.sala,
    required this.onUpdateSala,
    super.key,
  });

  /// A sala do ativo.
  final Sala? sala;

  /// Função chamada quando a sala é atualizada.
  final void Function(Sala?) onUpdateSala;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<AuthBloc, AuthState>(
      bloc: Modular.get<AuthBloc>(),
      builder: (context, state) {
        return Column(
          children: [
            if (sala == null)
              AnimatedContainer(
                height: 200,
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(8),
                    topRight: const Radius.circular(8),
                    bottomLeft:
                        state.isAdmin ? Radius.zero : const Radius.circular(8),
                    bottomRight:
                        state.isAdmin ? Radius.zero : const Radius.circular(8),
                  ),
                  color: theme.colorScheme.onSurface.withOpacity(0.1),
                  border: Border.all(
                    color: theme.colorScheme.onSurfaceVariant,
                    width: 0.5,
                  ),
                ),
                child: const Center(
                  child: Text('Sem informações de localização.'),
                ),
              ),
            if (sala != null)
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(8),
                  topRight: const Radius.circular(8),
                  bottomLeft:
                      state.isAdmin ? Radius.zero : const Radius.circular(8),
                  bottomRight:
                      state.isAdmin ? Radius.zero : const Radius.circular(8),
                ),
                child: SizedBox(
                  height: 200,
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned.fill(
                        child: _BlurredImage(
                          imagem: sala?.imagem ?? '',
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          // color: theme.colorScheme.onSurface.withOpacity(0.4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _Tile(
                                title: 'Sala',
                                value: sala!.nome,
                              ),
                              _Tile(
                                title: 'Bloco',
                                value: sala!.bloco.nome,
                              ),
                              _Tile(
                                title: 'Campus',
                                value: sala!.bloco.campus,
                              ),
                              _Tile(
                                title: 'Cidade',
                                value: sala!.bloco.cidade,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (state.isAdmin)
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  //only border on the bottom and the left and the right
                  border: Border(
                    bottom: BorderSide(
                      color: theme.colorScheme.onSurfaceVariant,
                      width: 0.5,
                    ),
                    left: BorderSide(
                      color: theme.colorScheme.onSurfaceVariant,
                      width: 0.5,
                    ),
                    right: BorderSide(
                      color: theme.colorScheme.onSurfaceVariant,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: TextButton(
                          //remove the border radius on the top of the button
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: const Radius.circular(8),
                                bottomRight: sala == null
                                    ? const Radius.circular(8)
                                    : Radius.zero,
                              ),
                            ),
                            backgroundColor:
                                theme.colorScheme.primary.withOpacity(0.2),
                          ),
                          onPressed: () async {
                            final sala = await MudarLocalDialog.show(
                              Modular.get<SalaBloc>(),
                            );
                            if (sala != null) {
                              onUpdateSala(sala);
                            }
                          },
                          child: sala != null
                              ? const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      HugeIcons.strokeRoundedExchange01,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8),
                                    Text('Mudar Local'),
                                  ],
                                )
                              : const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      HugeIcons.strokeRoundedAdd01,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8),
                                    Text('Adicionar Local'),
                                  ],
                                ),
                        ),
                      ),
                    ),
                    if (sala != null)
                      Container(
                        width: 50,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(8),
                          ),
                          //make border on the right only
                          border: Border(
                            left: BorderSide(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            //make border on the right only

                            shadowColor: theme.colorScheme.error,
                            backgroundColor:
                                theme.colorScheme.error.withOpacity(0.2),
                          ),
                          onPressed: () async {
                            final confirmed = await showDialog<bool>(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Remover Local'),
                                  content: Text(
                                    'Deseja remover o local ${sala!.nome}?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Modular.to.pop(false);
                                      },
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Modular.to.pop(true);
                                      },
                                      child: const Text('Confirmar'),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (confirmed ?? false) {
                              onUpdateSala(null);
                            }
                          },
                          child: Icon(
                            HugeIcons.strokeRoundedDelete02,
                            color: theme.colorScheme.error,
                            size: 20,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}

class _BlurredImage extends StatelessWidget {
  const _BlurredImage({
    required this.imagem,
  });

  final String imagem;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SoftEdgeBlur(
        edges: [
          EdgeBlur(
            type: EdgeType.bottomEdge,
            size: 110,
            sigma: 30,
            tileMode: TileMode.repeated,
            tintColor: const Color(0x4D000000).withOpacity(0.5),
            controlPoints: [
              ControlPoint(
                position: 0.5,
                type: ControlPointType.visible,
              ),
              ControlPoint(
                position: 1,
                type: ControlPointType.transparent,
              ),
            ],
          ),
        ],
        child: Image.asset(
          imagem,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final valueTileStyle = TextStyle(
      fontSize: 16,
      color: colorScheme.onPrimary,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AutoSizeText(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            color: colorScheme.onPrimary.withOpacity(0.5),
          ),
        ),
        AutoSizeText(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          maxFontSize: 16,
          style: valueTileStyle,
        ),
      ],
    );
  }
}
