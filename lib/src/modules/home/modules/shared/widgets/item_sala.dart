import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:repositories/repositories.dart';

/// Item que exibe informações sobre uma sala.
class ItemSala extends StatelessWidget {
  /// {@macro item_sala}
  const ItemSala({
    required this.sala,
    super.key,
  });

  /// A sala.
  final Sala sala;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${sala.nome} - ${sala.bloco.nome}'),
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
