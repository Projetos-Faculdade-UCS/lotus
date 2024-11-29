import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/events.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/sala_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/item_sala.dart';
import 'package:repositories/repositories.dart';

/// Tela com formulário para alterar a localização de um ativo.
class MudarLocalWidget extends StatelessWidget {
  /// {@macro mudar_local_widget}
  const MudarLocalWidget({
    required this.salas,
    super.key,
  });

  /// Lista de salas disponíveis.
  final List<Sala> salas;

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(16),
      width: 500,
      child: Flexible(
        flex: 2,
        child: Column(
          children: [
            // dotted card weitten 'novo local' in the middle
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Buscar Sala',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onSubmitted: (text) {
                // Dispatch the GetAllSalas event with the input text
                context.read<SalaBloc>().add(GetAllSalas(nomeSala: text));
              },
            ),
            const SizedBox(
              height: 8,
            ), // Spacing between TextField and ListView
            Expanded(
              child: ListView.builder(
                itemCount: salas.length,
                itemBuilder: (context, index) {
                  final sala = salas[index];
                  return ItemSala(
                    sala: sala,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
