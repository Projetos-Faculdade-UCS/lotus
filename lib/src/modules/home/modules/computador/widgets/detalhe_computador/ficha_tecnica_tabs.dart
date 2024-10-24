import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/info_tile.dart';

class FichaTecnicaTabs extends StatelessWidget {
  const FichaTecnicaTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            blurRadius: 4,
            offset: const Offset(
              0,
              1,
            ), // Sombra apenas para baixo (eixo Y positivo)
          ),
        ],
      ),
      child: const DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: 'Informações',
                  icon: Icon(
                    HugeIcons.strokeRoundedInformationCircle,
                  ),
                ),
                Tab(
                  icon: Icon(
                    HugeIcons.strokeRoundedCd,
                  ),
                  text: 'Programas',
                ),
                Tab(
                  icon: Icon(
                    HugeIcons.strokeRoundedCertificate01,
                  ),
                  text: 'Licenças',
                ),
              ],
            ),
            Flexible(
              child: TabBarView(
                children: [
                  _InfoTab(),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: ListView(
        children: const [
          InfoTile(
            title: 'Memória RAM',
            value: Text(
              '16GB DDR4',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          InfoTile(
            title: 'Armazenamento',
            value: Text(
              '512GB SSD',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          InfoTile(
            title: 'Processador',
            value: Text(
              'Intel Core i7 10ª Geração',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          InfoTile(
            title: 'Processador',
            value: Text(
              'Intel Core i7 10ª Geração',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          InfoTile(
            title: 'Processador',
            value: Text(
              'Intel Core i7 10ª Geração',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          InfoTile(
            title: 'Processador',
            value: Text(
              'Intel Core i7 10ª Geração',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          InfoTile(
            title: 'Processador',
            value: Text(
              'Intel Core i7 10ª Geração',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgramasTab extends StatelessWidget {
  const _ProgramasTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return InfoTile(
          title: 'Programa $index',
          value: const Text(
            'Versão 1.0',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }
}
