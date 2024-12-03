import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:repositories/repositories.dart';

/// {@template computers_pie_chart}
/// A widget that displays the computers pie chart.
/// {@endtemplate}
class ComputersPieChart extends StatefulWidget {
  /// {@macro computers_pie_chart}
  const ComputersPieChart({
    required this.computadores,
    super.key,
  });

  /// The computers to display.
  final DashboardComputadores computadores;

  @override
  State<ComputersPieChart> createState() => _ComputersPieChartState();
}

class _ComputersPieChartState extends State<ComputersPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double getRadius(int index) {
              return touchedIndex == index
                  ? constraints.maxHeight * 0.33
                  : constraints.maxHeight * 0.3;
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Visão Geral dos Computadores',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (touchEvent, touchResponse) {
                          setState(() {
                            if (touchResponse?.touchedSection == null) {
                              touchedIndex = -1;
                            } else {
                              touchedIndex = touchResponse!
                                  .touchedSection!.touchedSectionIndex;
                            }
                          });
                        },
                      ),
                      sections: [
                        PieChartSectionData(
                          value: widget.computadores.automaticos.toDouble(),
                          title:
                              'Automáticos:\n${widget.computadores.automaticos}',
                          color: Colors.blue,
                          radius: getRadius(0),
                        ),
                        PieChartSectionData(
                          value: widget.computadores.manuais.toDouble(),
                          title: 'Manuais:\n${widget.computadores.manuais}',
                          color: Colors.red,
                          radius: getRadius(1),
                        ),
                      ],
                      sectionsSpace: 2,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
