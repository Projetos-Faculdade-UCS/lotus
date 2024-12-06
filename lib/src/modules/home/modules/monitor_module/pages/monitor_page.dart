import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/monitor_module/bloc/monitores_bloc.dart';
import 'package:lotus/src/modules/home/modules/monitor_module/widgets/monitor_widget.dart';
import 'package:lotus/src/modules/home/widgets/breadcrumb/miolo_with_breadcrumb.dart';

/// {@template monitor_page}
/// A monitor page.
/// {@endtemplate}
class MonitorPage extends StatelessWidget {
  /// {@macro monitor_page}
  const MonitorPage({
    required this.id,
    required this.monitoresBloc,
    super.key,
  });

  /// ID do monitor.
  final int id;

  /// BLoC de monitores.
  final MonitoresBloc monitoresBloc;

  @override
  Widget build(BuildContext context) {
    return MioloWithBreadcrumb(
      child: BlocProvider.value(
        value: monitoresBloc..add(GetMonitor(id)),
        child: BlocBuilder<MonitoresBloc, MonitoresState>(
          builder: (context, state) {
            if (state is MonitoresInitial || state is MonitoresLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MonitorSuccess) {
              return MonitorWidget(
                monitor: state.monitor,
                monitoresBloc: monitoresBloc,
              );
            } else {
              return const Center(
                child: Text('Erro ao carregar monitor.'),
              );
            }
          },
        ),
      ),
    );
  }
}
