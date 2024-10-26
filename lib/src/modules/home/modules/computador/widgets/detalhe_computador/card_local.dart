import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:repositories/repositories.dart';
import 'package:soft_edge_blur/soft_edge_blur.dart';

/// {@template card_local}
/// Card que exibe informações sobre a localização de um ativo.
/// {@endtemplate}
class CardLocal extends StatelessWidget {
  /// {@macro card_local}
  const CardLocal({required this.sala, super.key});

  /// A sala do ativo.
  final Sala sala;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ColoredBox(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(.20),
              child: Center(
                child: AutoSizeText(
                  'Localização',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: _buildBluttedImage(context),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _Tile(
                      title: 'Sala',
                      value: sala.nome,
                    ),
                    _Tile(
                      title: 'Bloco',
                      value: sala.bloco.nome,
                    ),
                    _Tile(
                      title: 'Campus',
                      value: sala.bloco.campus,
                    ),
                    _Tile(
                      title: 'Cidade',
                      value: sala.bloco.cidade,
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

  SoftEdgeBlur _buildBluttedImage(BuildContext context) {
    return SoftEdgeBlur(
      edges: const [
        // EdgeBlur(
        //   type: EdgeType.bottomEdge,
        //   size: 110,
        //   sigma: 30,
        //   tintColor: const Color(0x4D000000).withOpacity(0.5),
        //   controlPoints: [
        //     ControlPoint(
        //       position: 0.5,
        //       type: ControlPointType.visible,
        //     ),
        //     ControlPoint(
        //       position: 1,
        //       type: ControlPointType.transparent,
        //     ),
        //   ],
        // ),
      ],
      child: Image.asset(
        'assets/ativos/local-fallback.png',
        fit: BoxFit.cover,
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
