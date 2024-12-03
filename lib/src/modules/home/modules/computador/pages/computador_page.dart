import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/bloc/computador/computador_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/widgets/detalhe_computador/computador_widget.dart';
import 'package:lotus/src/modules/home/widgets/breadcrumb/miolo_with_breadcrumb.dart';

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
    return MioloWithBreadcrumb(
      child: BlocProvider(
        create: (context) => computadorBloc
          ..add(
            GetComputador(id),
          ),
        child: BlocBuilder<ComputadorBloc, ComputadorState>(
          builder: (context, state) {
            if (state is ComputadorLoading || state is ComputadorInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetComputadorSuccess) {
              return ComputadorWidget(
                computador: state.computador,
                computadorBloc: computadorBloc,
              );
            } else {
              return const Center(
                child: Text('Erro ao carregar computador.'),
              );
            }
          },
        ),
      ),
    );
  }
}
