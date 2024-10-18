import 'package:ativos_ui/src/widgets/custom_badge.dart';
import 'package:ativos_ui/src/widgets/tipo_ativo_icone.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus_utils/lotus_utils.dart';
import 'package:repositories/repositories.dart';

/// Card de ativo de TI.
class AtivoCard extends StatelessWidget {
  /// Cria um card de ativo de TI.
  const AtivoCard({
    required this.ativo,
    this.onTap,
    super.key,
  });

  /// Ativo de TI.
  final Ativo ativo;

  /// Função chamada quando o card é pressionado.
  final VoidCallback? onTap;

  // Define text styles as static constants for reuse.
  static const TextStyle _titleTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle _subtitleTextStyle = TextStyle(
    fontSize: 16,
  );

  static const TextStyle _infoTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: _buildCardShape(context),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(
                ativo: ativo,
                titleTextStyle: _titleTextStyle,
                subtitleTextStyle: _subtitleTextStyle,
              ),
              const SizedBox(height: 16),
              _Info(ativo: ativo),
            ],
          ),
        ),
      ),
    );
  }

  ShapeBorder _buildCardShape(BuildContext context) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.ativo,
    required this.titleTextStyle,
    required this.subtitleTextStyle,
  });

  final Ativo ativo;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ativo.nome,
                style: titleTextStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                '#${ativo.patrimonio} • Atualizado ${ativo.ultimaAtualizacao?.timeAgo}',
                style: subtitleTextStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        if (ativo.automatico)
          CustomBadge(
            backgroundColor: Theme.of(context).colorScheme.primary,
            label: const Text(
              'Automático',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({
    required this.ativo,
  });

  final Ativo ativo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TipoAtivoIcone(tipo: ativo.tipo),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: InfoItem(
                      icon: HugeIcons.strokeRoundedBuilding03,
                      text: '${ativo.sala.bloco.nome} - ${ativo.sala.nome}',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: InfoItem(
                      icon: ativo.emUso
                          ? HugeIcons.strokeRoundedUser
                          : HugeIcons.strokeRoundedPackage,
                      text: ativo.emUso ? 'Em uso' : 'Em estoque',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              InfoItem(
                icon: HugeIcons.strokeRoundedWorkflowSquare06,
                text: ativo.relacionamentos > 0
                    ? '${ativo.relacionamentos} relacionamento(s)'
                    : 'Nenhum relacionamento',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// {@template info_item}
/// A reusable widget for displaying an icon and text.
/// {@endtemplate}
class InfoItem extends StatelessWidget {
  /// Creates an info item.
  const InfoItem({
    required this.icon,
    required this.text,
    this.iconSize = 20,
    super.key,
  });

  /// Icon to display.
  final IconData icon;

  /// Text to display.
  final String text;

  /// Size of the icon.
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HugeIcon(
          icon: icon,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          size: iconSize,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: AtivoCard._infoTextStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
