import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/modules/dashboard/pages/widgets/additional_details_chart.dart';
import 'package:lotus/src/modules/home/modules/dashboard/pages/widgets/computers_pie_chart.dart';
import 'package:lotus/src/modules/home/modules/dashboard/pages/widgets/rooms_bar_chart.dart';
import 'package:repositories/repositories.dart';

/// {@template dashboard_chart}
/// A widget that displays the dashboard chart.
/// {@endtemplate}
class DashboardCharts extends StatelessWidget {
  /// {@macro dashboard_chart}
  const DashboardCharts({required this.dashboard, super.key});

  /// The dashboard to display.
  final Dashboard dashboard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ComputersPieChart(
                    computadores: dashboard.computadores,
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: RoomsBarChart(
                    salas: dashboard.salas,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(child: AdditionalDetailsChart(dashboard: dashboard)),
        ],
      ),
    );
  }
}
