import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/impressora/bloc/impressoras_bloc.dart';
import 'package:lotus/src/modules/home/modules/impressora/widgets/impressora_widget.dart';
import 'package:lotus/src/modules/home/widgets/breadcrumb/miolo_with_breadcrumb.dart';

/// {@template impressora_page}
/// A impressora page.
/// {@endtemplate}
class ImpressoraPage extends StatelessWidget {
  /// {@macro impressora_page}
  const ImpressoraPage({
    required this.id,
    required this.impressorasBloc,
    super.key,
  });

  /// ID da impressora.
  final int id;

  /// BLoC de impressoras.
  final ImpressorasBloc impressorasBloc;

  @override
  Widget build(BuildContext context) {
    return MioloWithBreadcrumb(
      child: BlocProvider.value(
        value: impressorasBloc..add(GetImpressora(id)),
        child: BlocBuilder<ImpressorasBloc, ImpressorasState>(
          builder: (context, state) {
            if (state is ImpressorasInitial || state is ImpressorasLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ImpressoraSuccess) {
              return ImpressoraWidget(impressora: state.impressora);
            } else {
              return const Center(
                child: Text('Erro ao carregar impressora.'),
              );
            }
          },
        ),
      ),
    );
  }
}
