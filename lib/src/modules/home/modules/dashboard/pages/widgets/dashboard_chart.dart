import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/modules/dashboard/pages/widgets/computers_pie_chart.dart';
import 'package:lotus/src/modules/home/modules/dashboard/pages/widgets/rooms_bar_chart.dart';
import 'package:repositories/repositories.dart';

/// {@template dashboard_chart}
/// A widget that displays the dashboard chart.
/// {@endtemplate}
class DashboardChart extends StatelessWidget {
  /// {@macro dashboard_chart}
  const DashboardChart({required this.dashboard, super.key});

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
          Expanded(child: _buildAdditionalDetails()),
        ],
      ),
    );
  }

  Widget _buildAdditionalDetails() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Additional Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildDetailRow(
              'Total Computers',
              dashboard.computadores.total.toString(),
            ),
            const SizedBox(height: 12),
            _buildDetailRow('Printers', dashboard.impressoras.toString()),
            const SizedBox(height: 12),
            _buildDetailRow('Monitors', dashboard.monitores.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
