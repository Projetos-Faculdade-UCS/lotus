import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/bloc/computadores/computadores_bloc.dart';

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
    return BlocProvider(
      create: (context) => computadoresBloc,
      child: BlocBuilder<ComputadoresBloc, ComputadoresState>(
        builder: (context, state) {
          if (state is ComputadoresLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ComputadoresSuccess) {
            return StreamBuilder(
              stream: state.computadores,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final computadores = snapshot.data!;
                  return ListView.builder(
                    itemCount: computadores.length,
                    itemBuilder: (context, index) {
                      final computador = computadores[index];
                      return AtivoCard(
                        ativo: computador,
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('Nenhum computador encontrado.'),
                  );
                }
              },
            );
          } else {
            return const Center(
              child: Text('Erro ao carregar computadores.'),
            );
          }
        },
      ),
    );
  }
}
