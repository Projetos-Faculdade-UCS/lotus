import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:lotus/src/modules/home/modules/dashboard/pages/widgets/dashboard_charts.dart';
import 'package:lotus_ui/lotus_ui.dart';

/// The Dashboard page of the application.
class DashboardPage extends StatefulWidget {
  /// Creates the Dashboard page.
  const DashboardPage({
    required this.bloc,
    super.key,
  });

  /// The [DashboardBloc] of the page.
  final DashboardBloc bloc;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    widget.bloc.add(FetchDashboard());
  }

  @override
  Widget build(BuildContext context) {
    return Miolo(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bem vindo ao Lotus!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => widget.bloc.add(FetchDashboard()),
          ),
        ],
      ),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        bloc: widget.bloc,
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DashboardLoaded) {
            return DashboardCharts(dashboard: state.dashboard);
          } else {
            return const Center(child: Text('Erro ao carregar dashboard'));
          }
        },
      ),
    );
  }
}
