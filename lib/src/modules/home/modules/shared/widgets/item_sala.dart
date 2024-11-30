import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:repositories/repositories.dart';

/// Item que exibe informações sobre uma sala.
class ItemSala extends StatelessWidget {
  /// {@macro item_sala}
  const ItemSala({
    required this.sala,
    required this.onTap,
    this.selected = false,
    super.key,
  });

  /// A sala.
  final Sala sala;

  /// Se a sala está selecionada.
  final bool selected;

  final void Function(Sala) onTap;

  @override
  Widget build(BuildContext context) {
    final blue = Theme.of(context).colorScheme.primary;
    return ListTile(
      onTap: () => onTap(sala),
      title: Text(
        '${sala.nome} - ${sala.bloco.nome}',
        style: TextStyle(
          color: selected ? blue : Colors.black,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
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
