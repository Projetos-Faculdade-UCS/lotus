import 'package:flutter/material.dart';
import 'package:repositories/repositories.dart';

class ItemMovimentacao extends StatelessWidget {
  const ItemMovimentacao({
    required this.movimentacao,
    super.key,
  });

  final Movimentacao movimentacao;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movimentacao.motivo),
      subtitle: Text(movimentacao.salaAtual.nome),
    );
  }
}
