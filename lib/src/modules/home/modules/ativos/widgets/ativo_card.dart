import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/modules/ativos/business_logic/models/ativo.dart';

/// Card de ativo de TI.
class AtivoCard extends StatelessWidget {
  /// Cria um card de ativo de TI.
  const AtivoCard({required this.ativo, super.key});

  /// Ativo de TI.
  final Ativo ativo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(ativo.nome),
        subtitle: Text(ativo.tipo.toString()),
      ),
    );
  }
}
