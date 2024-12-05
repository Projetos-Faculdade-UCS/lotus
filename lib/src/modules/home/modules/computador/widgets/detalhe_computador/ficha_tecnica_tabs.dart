import 'package:ativos_ui/src/widgets/info_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/no_content.dart';
import 'package:repositories/repositories.dart';

/// Widget que exibe as abas de informações de um computador.
class FichaTecnicaTabs extends StatelessWidget {
  /// Cria uma instância de [FichaTecnicaTabs].
  const FichaTecnicaTabs({required this.computador, super.key});

  /// O computador que será exibido.
  final Computador computador;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            blurRadius: .5,
            offset: const Offset(
              0,
              .4,
            ), // Sombra apenas para baixo (eixo Y positivo)
          ),
        ],
      ),
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(
                  text: 'Geral',
                  icon: Icon(
                    HugeIcons.strokeRoundedInformationCircle,
                  ),
                ),
                Tab(
                  icon: Icon(
                    HugeIcons.strokeRoundedCertificate01,
                  ),
                  text: 'Licenças',
                ),
                Tab(
                  icon: Icon(
                    HugeIcons.strokeRoundedCd,
                  ),
                  text: 'Programas',
                ),
              ],
            ),
            Flexible(
              child: TabBarView(
                children: [
                  _InfoTab(
                    computador: computador,
                  ),
                  _LicencasTab(licencas: computador.licencas),
                  _ProgramasTab(programas: computador.programas),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTab extends StatelessWidget {
  const _InfoTab({
    required this.computador,
  });

  final Computador computador;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final hds =
        computador.hd.split(';').where((hd) => hd.trim().isNotEmpty).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: ListView(
        children: [
          if (computador.descricao.isNotEmpty)
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Descrição',
                style: TextStyle(
                  fontSize: 14,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              subtitle: Text(
                computador.descricao,
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.onSurface,
                ),
              ),
            )
          else
            const NoContent(text: 'Sem descrição'),
          if (computador.sistemaOperacional.isNotEmpty)
            InfoTile(
              leading: SvgPicture.asset(
                'assets/icons/windows.svg',
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  colorScheme.onSurfaceVariant,
                  BlendMode.srcIn,
                ),
              ),
              title: 'Sistema Operacional',
              value: Text(
                computador.sistemaOperacional,
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.onSurface,
                ),
              ),
            )
          else
            const NoContent(text: 'Sem sistema operacional'),
          if (computador.modeloCpu.isNotEmpty)
            InfoTile(
              leading: SvgPicture.asset(
                'assets/icons/cpu.svg',
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  colorScheme.onSurfaceVariant,
                  BlendMode.srcIn,
                ),
              ),
              title: 'Processador',
              value: Text(
                computador.modeloCpu,
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.onSurface,
                ),
              ),
            )
          else
            const NoContent(text: 'Sem processador'),
          if (computador.tamanhoRam.isNotEmpty)
            InfoTile(
              leading: SvgPicture.asset(
                'assets/icons/memory.svg',
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  colorScheme.onSurfaceVariant,
                  BlendMode.srcIn,
                ),
              ),
              title: 'Memória RAM',
              value: Text(
                computador.tamanhoRam,
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.onSurface,
                ),
              ),
            )
          else
            const NoContent(text: 'Sem memória RAM'),
          if (hds.isNotEmpty)
            ListTile(
              leading: const Icon(
                HugeIcons.strokeRoundedHdd,
              ),
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Armazenamento',
                style: TextStyle(
                  fontSize: 14,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  for (final hd in hds) ...[
                    Text(
                      hd.trim(),
                      style: TextStyle(
                        fontSize: 16,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                ],
              ),
            )
          else
            const NoContent(text: 'Sem armazenamento'),
          if (computador.placaMae.isNotEmpty)
            InfoTile(
              leading: SvgPicture.asset(
                'assets/icons/circuit.svg',
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  colorScheme.onSurfaceVariant,
                  BlendMode.srcIn,
                ),
              ),
              title: 'Placa mãe',
              value: Text(
                computador.placaMae,
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.onSurface,
                ),
              ),
            )
          else
            const NoContent(text: 'Sem placa mãe'),
          if (computador.fabricante.isNotEmpty)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                HugeIcons.strokeRoundedFactory02,
              ),
              title: Text(
                'Fabricante',
                style: TextStyle(
                  fontSize: 14,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              subtitle: Text(
                computador.fabricante,
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.onSurface,
                ),
              ),
            )
          else
            const NoContent(text: 'Sem fabricante'),
          if (computador.numeroSerie?.isNotEmpty ?? false)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                HugeIcons.strokeRoundedGrid,
              ),
              title: Text(
                'Número de série',
                style: TextStyle(
                  fontSize: 14,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              subtitle: Text(
                computador.numeroSerie!,
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.onSurface,
                ),
              ),
            )
          else
            const NoContent(
              text: 'Sem número de série',
            ),
        ],
      ),
    );
  }
}

class _ProgramasTab extends StatelessWidget {
  const _ProgramasTab({
    required this.programas,
  });

  final List<Programa> programas;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (programas.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              HugeIcons.strokeRoundedCd,
              color: theme.colorScheme.onSurfaceVariant,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              'Sem programas',
              style: TextStyle(
                fontSize: 16,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      itemCount: programas.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(
            HugeIcons.strokeRoundedCd,
          ),
          //small height
          title: Text(
            programas[index].nome,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            'Versão: ${programas[index].versao}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}

class _LicencasTab extends StatelessWidget {
  const _LicencasTab({
    required this.licencas,
  });

  final List<LicencaSoftware> licencas;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (licencas.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              HugeIcons.strokeRoundedCertificate01,
              color: theme.colorScheme.onSurfaceVariant,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              'Sem licenças',
              style: TextStyle(
                fontSize: 16,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      itemCount: licencas.length,
      itemBuilder: (context, index) {
        final licenca = licencas[index];
        final isAtivo = licenca.dataExpiracao.isAfter(DateTime.now());
        return ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 12,
          leading: SizedBox(
            width: 55,
            child: Column(
              children: [
                Icon(
                  isAtivo ? Icons.check_circle : Icons.error,
                  color: isAtivo ? Colors.green : Colors.red,
                ),
                const SizedBox(height: 4),
                Text(
                  isAtivo ? 'Ativo' : 'Expirado',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          title: Text(
            licenca.nome,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Usando ${licenca.quantidadeEmUso} '
                'de ${licenca.quantidade} licenças',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                isAtivo
                    ? 'Válido até ${formatData(licenca.dataExpiracao)}'
                    : 'Expirado em ${formatData(licenca.dataExpiracao)}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }

  /// recebe um objeto DateTime e retorna uma string no formato 10 Jan 2022
  String formatData(DateTime data) {
    return DateFormat('dd MMM yyyy').format(data);
  }
}
