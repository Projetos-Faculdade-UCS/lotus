import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotus/src/extensions/datetime_extension.dart';
import 'package:lotus/src/modules/home/modules/ativos/business_logic/models/ativo.dart';
import 'package:lotus/src/modules/home/modules/ativos/widgets/custom_badge.dart';

/// Card de ativo de TI.
class AtivoCard extends StatelessWidget {
  /// Cria um card de ativo de TI.
  const AtivoCard({required this.ativo, super.key});

  /// Ativo de TI.
  final Ativo ativo;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Color(0xFFA1A1AA),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              ativo.nome,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              '#${ativo.patrimonio}  •  Atualizado ${ativo.ultimaAtualizacao.timeAgo}',
              style: const TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.w500,
              ),
            ),
            trailing: CustomBadge(
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: const Text(
                'Automático',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              ativo.imagem,
            ),
          ),
        ],
      ),
    );
  }
}
