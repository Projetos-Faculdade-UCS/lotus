import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/bloc/computador/computador_bloc.dart';
import 'package:lotus/src/modules/home/widgets/breadcrumb/miolo_with_breadcrumb.dart';

/// {@template computadores_page}
/// Página de computadores.
/// {@endtemplate}
class ComputadoresPage extends StatelessWidget {
  /// {@macro computadores_page}
  const ComputadoresPage({
    required this.computadorBloc,
    super.key,
  });

  /// Bloc de computadores.
  final ComputadorBloc computadorBloc;

  @override
  Widget build(BuildContext context) {
    return MioloWithBreadcrumb(
      title: 'Computadores',
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider.value(
          value: computadorBloc..add(FetchComputadores()),
          child: BlocBuilder<ComputadorBloc, ComputadorState>(
            builder: (context, state) {
              if (state is ComputadorLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FetchComputadoresSuccess) {
                return AtivosList(
                  ativos: state.computadores,
                );
              } else {
                return const Center(
                  child: Text('Erro ao carregar computadores.'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
