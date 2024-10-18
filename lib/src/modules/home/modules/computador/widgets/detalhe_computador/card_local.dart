import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:soft_edge_blur/soft_edge_blur.dart';

class CardLocal extends StatelessWidget {
  const CardLocal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned.fill(
              child: _buildBluttedImage(context),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _Tile(
                    title: 'Sala',
                    value: '307',
                  ),
                  _Tile(
                    title: 'Bloco',
                    value: '71',
                  ),
                  _Tile(
                    title: 'Campus',
                    value: 'Principal',
                  ),
                  _Tile(
                    title: 'Prédio',
                    value: 'Principal',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SoftEdgeBlur _buildBluttedImage(BuildContext context) {
    return SoftEdgeBlur(
      edges: [
        EdgeBlur(
          type: EdgeType.bottomEdge,
          size: 100,
          sigma: 30,
          tintColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
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
    super.key,
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
            color: colorScheme.onSurfaceVariant,
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
