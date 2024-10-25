import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/bloc/computador/computador_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/computador_widget.dart';
import 'package:lotus_ui/lotus_ui.dart';

/// {@template computador_page}
/// Página de detalhes do computador.
/// {@endtemplate}
class ComputadorPage extends StatelessWidget {
  /// {@macro computador_page}
  const ComputadorPage({
    required this.computadorBloc,
    required this.id,
    super.key,
  });

  /// BLoC de computador.
  final ComputadorBloc computadorBloc;

  /// ID do computador.
  final int id;

  @override
  Widget build(BuildContext context) {
    return Miolo(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocProvider(
          create: (context) => computadorBloc
            ..add(
              ComputadorFetch(id),
            ),
          child: BlocBuilder<ComputadorBloc, ComputadorState>(
            builder: (context, state) {
              if (state is ComputadorLoading || state is ComputadorInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ComputadorSuccess) {
                return ComputadorWidget(computador: state.computador);
              } else {
                return const Center(
                  child: Text('Erro ao carregar computador.'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
