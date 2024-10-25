import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/bloc/computadores/computadores_bloc.dart';
import 'package:lotus_ui/lotus_ui.dart';

/// {@template computadores_page}
/// Página de computadores.
/// {@endtemplate}
class ComputadoresPage extends StatelessWidget {
  /// {@macro computadores_page}
  ComputadoresPage({
    required this.computadoresBloc,
    super.key,
  }) {
    computadoresBloc.add(ComputadoresFetch());
  }

  /// Bloc de computadores.
  final ComputadoresBloc computadoresBloc;

  @override
  Widget build(BuildContext context) {
    return Miolo(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (context) => computadoresBloc,
          child: BlocBuilder<ComputadoresBloc, ComputadoresState>(
            builder: (context, state) {
              if (state is ComputadoresLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ComputadoresSuccess) {
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
