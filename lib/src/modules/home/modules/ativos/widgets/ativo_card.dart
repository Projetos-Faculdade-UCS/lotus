import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/constants/colors.dart';
import 'package:lotus/src/extensions/datetime_extension.dart';
import 'package:lotus/src/modules/home/modules/ativos/business_logic/models/ativo.dart';
import 'package:lotus/src/modules/home/modules/ativos/widgets/custom_badge.dart';
import 'package:lotus/src/modules/home/modules/ativos/widgets/tipo_ativo_icone.dart';

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
            title: Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                ativo.nome,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            subtitle: Text(
              '#${ativo.patrimonio}  •  Atualizado ${ativo.ultimaAtualizacao.timeAgo}',
              style: const TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.w500,
              ),
            ),
            trailing: ativo.automatico
                ? CustomBadge(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    label: const Text(
                      'Automático',
                      textAlign: TextAlign.center,
                    ),
                  )
                : null,
          ),
          ListTile(
            leading: TipoAtivoIcone(tipo: ativo.tipo),
            title: Column(
              children: [
                Row(
                  children: [
                    const HugeIcon(
                      icon: HugeIcons.strokeRoundedBuilding03,
                      color: lightBodyText,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${ativo.sala?.bloco.nome ?? 'Sem bloco'} - ${ativo.sala?.nome ?? 'Sem sala'}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 20),
                    HugeIcon(
                      icon: ativo.emUso
                          ? HugeIcons.strokeRoundedUser
                          : HugeIcons.strokeRoundedPackage,
                      color: lightBodyText,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      ativo.emUso ? 'Em uso' : 'Em estoque',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const HugeIcon(
                      icon: HugeIcons.strokeRoundedWorkflowSquare06,
                      color: lightBodyText,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      ativo.relacionamentos > 0
                          ? '${ativo.relacionamentos} relacionamento(s)'
                          : 'Nenhum relacionamento',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}