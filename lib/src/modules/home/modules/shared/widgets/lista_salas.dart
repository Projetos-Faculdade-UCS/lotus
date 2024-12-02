import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/events.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/sala_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/states.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/item_sala.dart';

/// Tela com formulário para alterar a localização de um ativo.
class ListaSalas extends StatelessWidget {
  /// {@macro mudar_local_widget}
  const ListaSalas({
    required this.bloc,
    super.key,
  });

  /// O bloc da sala.
  final SalaBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalaBloc, GenericState>(
      bloc: bloc..add(const GetAllSalas()),
      builder: (context, state) {
        if (state is GenericInitial || state is GenericLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SalasSuccess) {
          return ListView.builder(
            itemCount: state.salas.length,
            itemBuilder: (context, index) {
              final sala = state.salas[index];
              return ItemSala(
                sala: sala,
                onTap: (sala) async {
                  ///make a confirmation dialog
                  final confirmed = await showDialog<bool>(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Mudar Local'),
                        content:
                            Text('Deseja mudar o local para ${sala.nome}?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Modular.to.pop(false);
                            },
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              Modular.to.pop(true);
                            },
                            child: const Text('Confirmar'),
                          ),
                        ],
                      );
                    },
                  );
                  if (confirmed ?? true) {
                    Modular.to.pop(sala);
                  }
                },
              );
            },
          );
        } else {
          return const Center(
            child: Text('Erro ao carregar salas.'),
          );
        }
      },
    );
  }
}
