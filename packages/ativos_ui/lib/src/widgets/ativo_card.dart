import 'package:ativos_ui/src/widgets/custom_badge.dart';
import 'package:ativos_ui/src/widgets/tipo_ativo_icone.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus_utils/lotus_utils.dart';
import 'package:repositories/repositories.dart';

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
        side: BorderSide(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
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
              '#${ativo.patrimonio}  • '
              ' Atualizado ${ativo.ultimaAtualizacao?.timeAgo}',
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
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedBuilding03,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${ativo.sala.bloco.nome} - '
                      '${ativo.sala.nome}',
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
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
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
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedWorkflowSquare06,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
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
