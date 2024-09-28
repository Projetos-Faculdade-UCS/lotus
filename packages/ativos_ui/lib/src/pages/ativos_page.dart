import 'package:ativos_base/ativos_base.dart';
import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:lotus_ui/lotus_ui.dart';

/// Página de ativos de TI (lista)
class AtivosPage extends StatelessWidget {
  /// Cria uma página de ativos de TI.
  const AtivosPage({super.key});

  /// Lista de ativos de TI.
  List<Ativo> get ativos {
    final sala = Sala(
      nome: 'Sala 101',
      bloco: Bloco(
        nome: 'Bloco 71',
        campus: 'Campus 1',
        cidade: 'Caxias do Sul',
      ),
    );
    return [
      Ativo(
        nome: 'Computador Intel 2023',
        tipo: TipoAtivo.computador,
        patrimonio: 123456,
        ultimaAtualizacao: DateTime(2023),
        automatico: true,
        emUso: true,
        sala: sala,
        relacionamentos: 1,
      ),
      Ativo(
        nome: 'Monitor HP L200hx',
        tipo: TipoAtivo.monitor,
        patrimonio: 654321,
        ultimaAtualizacao: DateTime(2022),
        sala: sala,
        emUso: false,
        automatico: false,
      ),
      Ativo(
        nome: 'Impressora Lexmark MX310dn ',
        tipo: TipoAtivo.impressora,
        patrimonio: 987654,
        ultimaAtualizacao: DateTime(2021),
        emUso: true,
        automatico: false,
        sala: sala,
        relacionamentos: 99,
      ),
      Ativo(
        nome: 'Pacote Office 2016',
        tipo: TipoAtivo.licencaSoftware,
        patrimonio: 456789,
        ultimaAtualizacao: DateTime(2020),
        emUso: false,
        automatico: false,
        sala: sala,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Miolo(
      appBar: AppBar(
        title: const Text('Ativos de TI'),
      ),
      child: ListView.builder(
        itemCount: ativos.length ~/ 2, // divisão inteira
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                child: AtivoCard(ativo: ativos[index * 2]),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AtivoCard(ativo: ativos[index * 2 + 1]),
              ),
            ],
          );
        },
      ),
    );
  }
}
