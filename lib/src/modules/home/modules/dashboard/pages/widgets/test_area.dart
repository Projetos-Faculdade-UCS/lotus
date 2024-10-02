import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus_api_client/lotus_api_client.dart';

class TestArea extends StatefulWidget {
  const TestArea({super.key});

  @override
  State<TestArea> createState() => _TestAreaState();
}

class _TestAreaState extends State<TestArea> {
  List<Map<String, dynamic>> _computadores = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final computadores = await Modular.get<LotusApiClient>()
                .get<List<dynamic>>('/computadores');

            if (computadores.data != null &&
                computadores.data!.every((element) => element is! Map)) {
              return;
            }

            final computadoresMap =
                computadores.data!.cast<Map<String, dynamic>>();

            setState(() {
              _computadores = computadoresMap;
            });
          },
          child: const Text('Fetch Computadores'),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: _computadores.length,
            itemBuilder: (context, index) {
              final computador = _computadores[index];
              return ListTile(
                title: Text(computador['nome'] as String),
                subtitle: Text(computador['tipo'] as String),
              );
            },
          ),
        ),
      ],
    );
  }
}
