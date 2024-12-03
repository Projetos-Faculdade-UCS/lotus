import 'package:flutter/material.dart';
import 'package:lotus_utils/lotus_utils.dart';
import 'package:repositories/repositories.dart';

class ItemMovimentacao extends StatelessWidget {
  const ItemMovimentacao({
    required this.movimentacao,
    required this.index,
    super.key,
  });

  final Movimentacao movimentacao;

  final int index;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    initTimeAgo();
    return Card(
      //custom style with border
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: theme.colorScheme.onSurfaceVariant,
          width: 0.5,
        ),
      ),
      color: theme.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$index.',
                    ),
                    const SizedBox(width: 4),
                    Text(
                      movimentacao.motivo,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  movimentacao.data.timeAgo,
                  style: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxWidth: 50, minHeight: 20),
                    child: Column(
                      children: [
                        Text(
                          'Sala',
                          style: TextStyle(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        Text(movimentacao.salaAtual?.nome ?? '-'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxWidth: 50, minHeight: 20),
                    child: Column(
                      children: [
                        Text(
                          'Bloco',
                          style: TextStyle(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        Text(movimentacao.salaAtual?.bloco.nome ?? '-'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
