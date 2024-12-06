import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/monitor_module/bloc/monitores_bloc.dart';
import 'package:lotus/src/modules/home/widgets/breadcrumb/miolo_with_breadcrumb.dart';
import 'package:repositories/repositories.dart';

/// {@template monitores_page}
/// A monitores page.
/// {@endtemplate}
class MonitoresPage extends StatelessWidget {
  /// {@macro monitores_page}
  const MonitoresPage({
    required this.monitoresBloc,
    super.key,
  });

  /// BLoC de monitores.
  final MonitoresBloc monitoresBloc;

  @override
  Widget build(BuildContext context) {
    return MioloWithBreadcrumb(
      child: BlocProvider.value(
        value: monitoresBloc..add(GetAllMonitores()),
        child: BlocBuilder<MonitoresBloc, MonitoresState>(
          builder: (context, state) {
            if (state is MonitoresInitial || state is MonitoresLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MonitoresSuccess) {
              return AtivosList(
                ativos: state.monitores,
                tipoAtivo: TipoAtivo.monitor,
              );
            } else {
              return const Center(
                child: Text('Erro ao carregar monitores.'),
              );
            }
          },
        ),
      ),
    );
  }
}
