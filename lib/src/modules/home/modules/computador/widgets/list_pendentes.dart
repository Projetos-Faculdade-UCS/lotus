import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/cubit/pendentes_cubit.dart';
import 'package:repositories/repositories.dart';

/// {@template list_pendentes}
/// Widget para exibir a lista de pendentes.
/// {@endtemplate}
class ListPendentes extends StatelessWidget {
  /// {@macro list_pendentes}
  const ListPendentes({
    required this.pendentes,
    super.key,
  });

  /// Lista de pendentes.
  final List<Ativo> pendentes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pendentes.length,
      itemBuilder: (context, index) {
        final computador = pendentes[index];
        return AtivoCard(
          ativo: computador,
          onTap: () {
            final cubit = context.read<PendentesCubit>();
            final value = cubit.state.selectedIds.contains(computador.id);
            if (value) {
              cubit.deselect(computador.id);
            } else {
              cubit.select(computador.id);
            }
          },
          trailing: BlocBuilder<PendentesCubit, PendentesState>(
            builder: (context, state) {
              final checkedIds = state.selectedIds;
              final cubit = context.read<PendentesCubit>();

              return Checkbox(
                value: checkedIds.contains(computador.id),
                onChanged: (value) {
                  if (value ?? false) {
                    cubit.select(computador.id);
                  } else {
                    cubit.deselect(computador.id);
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
