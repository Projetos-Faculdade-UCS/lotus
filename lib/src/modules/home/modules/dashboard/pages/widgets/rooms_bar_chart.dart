import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:repositories/repositories.dart';

/// {@template rooms_bar_chart}
/// A widget that displays the rooms bar chart.
/// {@endtemplate}
class RoomsBarChart extends StatelessWidget {
  /// {@macro rooms_bar_chart}
  const RoomsBarChart({
    required this.salas,
    super.key,
  });

  /// The rooms to display.
  final DashboardSalas salas;

  static const _barBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(6),
    topRight: Radius.circular(6),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Status das Salas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final barWidth = constraints.maxWidth * 0.02;

                  return BarChart(
                    BarChartData(
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barRods: [
                            BarChartRodData(
                              toY: salas.total.toDouble(),
                              color: Colors.grey,
                              width: barWidth,
                              borderRadius: _barBorderRadius,
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                              toY: salas.comAtivos.toDouble(),
                              color: Colors.green,
                              width: barWidth,
                              borderRadius: _barBorderRadius,
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(
                              toY: salas.vazias.toDouble(),
                              color: Colors.orange,
                              width: barWidth,
                              borderRadius: _barBorderRadius,
                            ),
                          ],
                        ),
                      ],
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (double value, TitleMeta meta) {
                              const baseStyle = TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              );
                              final isSmall = constraints.maxWidth < 300;
                              final style = baseStyle.copyWith(
                                fontSize: isSmall ? 10 : 14,
                              );

                              Widget text;
                              switch (value.toInt()) {
                                case 0:
                                  text = Text(
                                    'Total de\nSalas',
                                    style: style,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    softWrap: true,
                                  );
                                case 1:
                                  text = Text(
                                    'Salas com\nAtivos',
                                    style: style,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    softWrap: true,
                                  );
                                case 2:
                                  text = Text(
                                    'Salas\nVazias',
                                    style: style,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    softWrap: true,
                                  );
                                default:
                                  text = Text('', style: style);
                              }
                              return SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: text,
                                ),
                              );
                            },
                            reservedSize: 60,
                          ),
                        ),
                        rightTitles: const AxisTitles(),
                        topTitles: const AxisTitles(),
                      ),
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipColor: (group) =>
                              group.barRods.first.color!,
                          tooltipRoundedRadius: 10,
                          tooltipPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            return BarTooltipItem(
                              rod.toY.toInt().toString(),
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
