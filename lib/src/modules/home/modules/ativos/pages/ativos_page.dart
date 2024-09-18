import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/modules/ativos/business_logic/models/ativo.dart';
import 'package:lotus/src/modules/home/modules/ativos/widgets/ativo_card.dart';
import 'package:lotus/src/modules/home/widgets/miolo.dart';

/// Página de ativos de TI (lista)
class AtivosPage extends StatelessWidget {
  /// Cria uma página de ativos de TI.
  const AtivosPage({super.key});

  static final List<Ativo> _ativos = [
    Ativo(
      nome: 'Computador Intel 2023',
      tipo: TipoAtivo.computador,
      patrimonio: 123456,
      ultimaAtualizacao: DateTime(2023),
    ),
    Ativo(
      nome: 'Monitor',
      tipo: TipoAtivo.monitor,
      patrimonio: 654321,
      ultimaAtualizacao: DateTime(2022),
    ),
    Ativo(
      nome: 'Impressora',
      tipo: TipoAtivo.impressora,
      patrimonio: 987654,
      ultimaAtualizacao: DateTime(2021),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Miolo(
      appBar: AppBar(
        title: const Text('Ativos de TI'),
      ),
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
