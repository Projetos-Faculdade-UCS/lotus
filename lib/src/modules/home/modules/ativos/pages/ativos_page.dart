import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/modules/ativos/business_logic/models/ativo.dart';
import 'package:lotus/src/modules/home/modules/ativos/widgets/ativo_card.dart';
import 'package:lotus/src/modules/home/widgets/miolo.dart';

/// Página de ativos de TI (lista)
class AtivosPage extends StatelessWidget {
  /// Cria uma página de ativos de TI.
  const AtivosPage({super.key});

  static final List<Ativo> _ativos = [
    Ativo(nome: 'Computador 007', tipo: TipoAtivo.computador),
    Ativo(nome: 'Monitor', tipo: TipoAtivo.monitor),
    Ativo(nome: 'Impressora', tipo: TipoAtivo.impressora),
  ];

  @override
  Widget build(BuildContext context) {
    return Miolo(
      child: ListView.builder(
        itemCount: _ativos.length,
        itemBuilder: (context, index) {
          final ativo = _ativos[index];
          return AtivoCard(ativo: ativo);
        },
      ),
    );
  }
}
