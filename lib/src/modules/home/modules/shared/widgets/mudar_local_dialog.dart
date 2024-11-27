import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/events.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/sala_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/states.dart';

/// Dialog para alterar a localização de um ativo.
class MudarLocalDialog extends StatelessWidget {
  /// {@macro mudar_local_dialog}
  const MudarLocalDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocProvider.value(
        value: Modular.get<SalaBloc>()..add(const GetAllSalas()),
        child: BlocBuilder<SalaBloc, GenericState>(
          builder: (context, state) {
            if (state is GenericInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SalasSuccess) {
              return ListView.builder(
                itemCount: state.salas.length,
                itemBuilder: (context, index) {
                  final sala = state.salas[index];
                  return ListTile(
                    title: Text(sala.nome),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('Erro ao carregar salas.'),
              );
            }
          },
        ),
      ),
    );
  }
}
