import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/modules/dashboard/pages/widgets/test_area.dart';
import 'package:lotus/src/modules/home/widgets/example_card.dart';
import 'package:lotus/src/modules/home/widgets/example_context_menu.dart';
import 'package:lotus_ui/lotus_ui.dart';

/// The Dashboard page of the application.
class DashboardPage extends StatelessWidget {
  /// Creates the Dashboard page.
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Miolo(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dashboard'),
      ),
      child: Column(
        children: [
          const Expanded(
            child: SizedBox.expand(
              child: Wrap(
                children: [
                  ExampleContextMenu(
                    child: ExampleCard(
                      title: Text('Card 1'),
                      subtitle: Text('Right-click me!'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            'Área de Testes',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: TestArea(),
            ),
          ),
        ],
      ),
    );
  }
}
