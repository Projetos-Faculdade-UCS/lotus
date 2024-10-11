import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/info_tile.dart';
import 'package:soft_edge_blur/soft_edge_blur.dart';

class CardLocal extends StatelessWidget {
  const CardLocal({super.key});

  @override
  Widget build(BuildContext context) {
    final valueTileStyle = TextStyle(
      fontSize: 16,
      color: Theme.of(context).colorScheme.onPrimary,
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _buildBluttedImage(context),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                InfoTile(
                  title: 'Sala',
                  value: Text('307', style: valueTileStyle),
                ),
                const SizedBox(width: 32),
                InfoTile(
                  title: 'Bloco',
                  value: Text('71', style: valueTileStyle),
                ),
                const SizedBox(width: 32),
                InfoTile(
                  title: 'Campus',
                  value: Text('Principal', style: valueTileStyle),
                ),
                const SizedBox(width: 32),
                InfoTile(
                  title: 'Cidade',
                  value: Text('Caxias do Sul', style: valueTileStyle),
                ),
              ],
            ),
          ),
        ],
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
