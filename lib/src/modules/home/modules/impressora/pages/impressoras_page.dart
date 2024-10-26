import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/impressora/bloc/impressoras_bloc.dart';
import 'package:lotus/src/modules/home/widgets/breadcrumb/miolo_with_breadcrumb.dart';

/// {@template impressoras_page}
/// A impressoras page.
/// {@endtemplate}
class ImpressorasPage extends StatelessWidget {
  /// {@macro impressoras_page}
  const ImpressorasPage({
    required this.impressorasBloc,
    super.key,
  });

  /// BLoC de impressoras.
  final ImpressorasBloc impressorasBloc;

  @override
  Widget build(BuildContext context) {
    return MioloWithBreadcrumb(
      child: BlocProvider.value(
        value: impressorasBloc..add(ImpressorasFetch()),
        child: BlocBuilder<ImpressorasBloc, ImpressorasState>(
          builder: (context, state) {
            if (state is ImpressorasInitial || state is ImpressorasLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ImpressorasSuccess) {
              return AtivosList(
                ativos: state.impressoras,
              );
            } else {
              return const Center(
                child: Text('Erro ao carregar impressoras.'),
              );
            }
          },
        ),
      ),
    );
  }
}
