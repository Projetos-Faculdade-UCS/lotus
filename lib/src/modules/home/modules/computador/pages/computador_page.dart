import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/computador_title.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/info_tile.dart';
import 'package:lotus_ui/lotus_ui.dart';
import 'package:repositories/repositories.dart';

class ComputadorPage extends StatelessWidget {
  const ComputadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Miolo(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: TipoAtivoIcone(
              tipo: TipoAtivo.computador,
              size: 80,
            ),
            title: ComputadorTitle(),
            //padding
            contentPadding: EdgeInsets.zero,
          ),
          SizedBox(height: 24),
          Row(
            children: [
              InfoTile(
                title: 'Responsável',
                value: 'João da Silva',
              ),
              SizedBox(width: 32),
              InfoTile(
                title: 'Ativos relacionados',
                value: '2',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
