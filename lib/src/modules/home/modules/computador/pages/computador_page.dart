import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/cabecalho_computador.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/card_local.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/ficha_tecnica_tabs.dart';
import 'package:lotus_ui/lotus_ui.dart';
import 'package:repositories/repositories.dart';

class ComputadorPage extends StatelessWidget {
  const ComputadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Miolo(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: ColoredBox(
        color: colorScheme.surface,
        child: Column(
          children: [
            Container(
              // adiciona uma shadow apenas na parte inferior bg fica branco
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow,
                    blurRadius: 4,
                    offset: const Offset(
                      0,
                      1,
                    ), // Sombra apenas para baixo (eixo Y positivo)
                  ),
                  BoxShadow(
                    color: theme.scaffoldBackgroundColor,
                    offset: const Offset(
                      0,
                      -8,
                    ), // Sombra apenas para baixo (eixo Y positivo)
                  ),
                ],
              ),
              child: const CabecalhoComputador(),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              HugeIcon(
                                icon: HugeIcons.strokeRoundedMapsLocation01,
                                color: colorScheme.onSurfaceVariant,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Local atual',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const CardLocal(),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              HugeIcon(
                                icon: HugeIcons.strokeRoundedClock04,
                                color: colorScheme.onSurfaceVariant,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Histórico de movimentações',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                          const Expanded(
                            child: Placeholder(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              HugeIcon(
                                icon: HugeIcons.strokeRoundedTask01,
                                color: colorScheme.onSurfaceVariant,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Ficha técnica',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Flexible(child: FichaTecnicaTabs()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Cria um objeto de [Computador] mockado para testes.
  Computador get computador => Computador(
        id: 1,
        tipo: TipoAtivo.computador,
        nome: 'HP Pavillion 5000',
        fabricante: 'HP',
        descricao: 'Computador de uso geral',
        automatico: true,
        patrimonio: 755706,
        emUso: true,
        sala: const Sala(
          id: 358,
          nome: '307',
          bloco: Bloco(
            id: 497,
            nome: 'Bloco 71',
            cidade: 'Caxias do Sul',
            campus: 'sede',
          ),
        ),
        relacionamentos: 21,
        responsavel: 'João da Silva',
        criticidade: CriticidadeDados.alta,
        tamanhoRam: '8GB',
        modeloCpu: 'Intel i5 12400',
        sistemaOperacional: 'Windows 11',
        programasInstalados: const [
          Programa(
            id: 1,
            nome: 'Microsoft .NET Runtime - 6.0.16 (x64',
            versao: '48.67.58427',
          ),
          Programa(
            id: 2,
            nome: 'Adobe Photoshop',
            versao: '2022',
          ),
        ],
        licencas: [
          LicencaSoftware(
            id: 1,
            nome: 'Microsoft Office 2019"',
            quantidade: 100,
            quantidadeEmUso: 10,
            descricao: 'Licença para uso do pacote Office 2019',
            dataExpiracao: DateTime(2023, 12, 31),
          ),
        ],
        valido: true,
        ultimaAtualizacao: DateTime.now(),
        placaMae: 'ASUS Prime B560M-A',
        hd: '256 GB (KINGSTON SA400S37256G)',
      );
}
