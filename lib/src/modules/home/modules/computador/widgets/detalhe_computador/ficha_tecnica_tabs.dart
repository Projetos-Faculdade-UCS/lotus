import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/info_tile.dart';

class FichaTecnicaTabs extends StatelessWidget {
  const FichaTecnicaTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}
