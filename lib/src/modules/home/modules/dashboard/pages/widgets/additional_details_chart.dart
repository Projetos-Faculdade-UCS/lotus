import 'package:drop_shadow/drop_shadow.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:repositories/repositories.dart';

/// {@template additional_details_chart}
/// A widget that displays the additional details chart.
/// {@endtemplate}
class AdditionalDetailsChart extends StatefulWidget {
  /// {@macro additional_details_chart}
  const AdditionalDetailsChart({
    required this.dashboard,
    super.key,
  });

  /// The dashboard to display.
  final Dashboard dashboard;

  @override
  State<AdditionalDetailsChart> createState() => _AdditionalDetailsChartState();
}

class _AdditionalDetailsChartState extends State<AdditionalDetailsChart> {
  int touchedIndex = -1;

  @override
  void didUpdateWidget(AdditionalDetailsChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.dashboard != widget.dashboard) {
      setState(() {
        touchedIndex = -1;
      });
    }
  }

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Distribuição de Ativos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Total: ${widget.dashboard.computadores.total + widget.dashboard.impressoras + widget.dashboard.monitores}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Builder(
                            builder: (context) {
                              if (widget.dashboard.computadores.total == 0 &&
                                  widget.dashboard.impressoras == 0 &&
                                  widget.dashboard.monitores == 0) {
                                return const Center(
                                  child: Text('Sem dados para exibir'),
                                );
                              }
                              return DropShadow(
                                offset: Offset.zero,
                                blurRadius: 4,
                                child: PieChart(
                                  PieChartData(
                                    pieTouchData: PieTouchData(
                                      touchCallback:
                                          (touchEvent, touchResponse) {
                                        setState(() {
                                          touchedIndex = touchResponse
                                                  ?.touchedSection
                                                  ?.touchedSectionIndex ??
                                              -1;
                                        });
                                      },
                                    ),
                                    sections: [
                                      PieChartSectionData(
                                        value: widget
                                            .dashboard.computadores.total
                                            .toDouble(),
                                        title: '',
                                        color: Colors.blue,
                                        radius: getRadius(0),
                                        gradient: const RadialGradient(
                                          colors: [
                                            Colors.blueGrey,
                                            Colors.blue,
                                          ],
                                        ),
                                      ),
                                      PieChartSectionData(
                                        value: widget.dashboard.impressoras
                                            .toDouble(),
                                        title: '',
                                        color: Colors.green,
                                        radius: getRadius(1),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.lightGreen,
                                            Colors.green,
                                          ],
                                        ),
                                      ),
                                      PieChartSectionData(
                                        value: widget.dashboard.monitores
                                            .toDouble(),
                                        title: '',
                                        color: Colors.orange,
                                        radius: getRadius(2),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.orangeAccent,
                                            Colors.orange,
                                          ],
                                        ),
                                      ),
                                    ],
                                    // sectionsSpace: 2,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _LegendItem(
                              color: Colors.blue,
                              text:
                                  'Computadores: ${widget.dashboard.computadores.total}',
                            ),
                            const SizedBox(height: 8),
                            _LegendItem(
                              color: Colors.green,
                              text:
                                  'Impressoras: ${widget.dashboard.impressoras}',
                            ),
                            const SizedBox(height: 8),
                            _LegendItem(
                              color: Colors.orange,
                              text: 'Monitores: ${widget.dashboard.monitores}',
                            ),
                          ],
                        ),
                      ],
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

class _LegendItem extends StatelessWidget {
  const _LegendItem({
    required this.color,
    required this.text,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
