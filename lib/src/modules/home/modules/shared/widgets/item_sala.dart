import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:repositories/repositories.dart';

/// Item que exibe informações sobre uma sala.
class ItemSala extends StatelessWidget {
  /// {@macro item_sala}
  const ItemSala({
    required this.sala,
    required this.onTap,
    super.key,
  });

  /// A sala.
  final Sala sala;

  /// Se a sala está selecionada.

  final void Function(Sala) onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () => onTap(sala),
      title: Text(
        'Bloco ${sala.bloco.nome} - ${sala.nome}',
        style: TextStyle(
          color: colorScheme.onSurface,
        ),
      ),
      subtitle: Row(
        children: [
          const Icon(
            HugeIcons.strokeRoundedLocation03,
          ),
          const SizedBox(width: 8),
          Text(sala.bloco.cidade),
        ],
      ),
      trailing: Text(sala.bloco.campus),
    );
  }
}
