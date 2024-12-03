import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/bloc/computador/computador_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/cubit/pendentes_cubit.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/list_pendentes.dart';
import 'package:lotus_ui/lotus_ui.dart';

/// {@template pendentes_page}
/// Page for pending items.
/// {@endtemplate}
class PendentesPage extends StatelessWidget {
  /// {@macro pendentes_page}
  const PendentesPage({
    required this.bloc,
    required this.cubit,
    super.key,
  });

  /// The bloc for the page.
  final ComputadorBloc bloc;

  /// The cubit for the page.
  final PendentesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Miolo(
        appBar: AppBar(
          title: const Text('Computadores pendentes'),
          scrolledUnderElevation: 0,
          actions: [
            BlocBuilder<PendentesCubit, PendentesState>(
              builder: (context, state) {
                void callback() {
                  final ids = context.read<PendentesCubit>().state.selectedIds;
                  bloc.add(ValidateComputadores(ids));
                }

                return IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: state.selectedIds.isNotEmpty ? callback : null,
                );
              },
            ),
            // select all

            BlocBuilder<ComputadorBloc, ComputadorState>(
              bloc: bloc,
              builder: (context, blocState) {
                return BlocBuilder<PendentesCubit, PendentesState>(
                  bloc: cubit,
                  builder: (context, state) {
                    final ids = state.selectedIds;

                    final isAllSelected = blocState is FetchPendentesSuccess &&
                        ids.length == blocState.computadores.length;
                    void callback() {
                      if (isAllSelected) {
                        cubit.clear();
                      } else {
                        cubit.selectAll(
                          (blocState as FetchPendentesSuccess)
                              .computadores
                              .map((e) => e.id)
                              .toList(),
                        );
                      }
                    }

                    return IconButton(
                      icon: Icon(
                        isAllSelected
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                      ),
                      onPressed:
                          blocState is! FetchPendentesSuccess ? null : callback,
                    );
                  },
                );
              },
            ),
          ],
        ),
        child: BlocConsumer<ComputadorBloc, ComputadorState>(
          bloc: bloc.state is! FetchPendentesSuccess
              ? (bloc..add(FetchPendentes()))
              : bloc,
          listener: (context, state) {
            if (state is ValidatedComputadoresSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Computadores validados com sucesso.'),
                ),
              );
              bloc.add(FetchPendentes());
              cubit.clear();
            }
          },
          builder: (context, state) {
            if (state is ComputadorLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FetchPendentesSuccess) {
              return ListPendentes(
                pendentes: state.computadores,
              );
            } else {
              return const Center(
                child: Text('Erro ao carregar os computadores pendentes.'),
              );
            }
          },
        ),
      ),
    );
  }
}
