import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:repositories/repositories.dart';

/// {@template test_area}
/// A widget that displays a list of [Ativo]s.
/// {@endtemplate}
class TestArea extends StatefulWidget {
  /// {@macro test_area}
  const TestArea({super.key});

  @override
  State<TestArea> createState() => _TestAreaState();
}

class _TestAreaState extends State<TestArea> {
  late ComputadorRepository _computadorRepository;
  late Stream<List<Ativo>> _computadores;

  @override
  void initState() {
    super.initState();
    _computadorRepository = Modular.get<ComputadorRepository>();

    // Check if there's already data in the stream
    _computadores = _computadorRepository.computadoresStream;
    _computadorRepository.fetchComputadores(); // Fetch new data
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Ativo>>(
      stream: _computadores,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No computadores found'),
          );
        }

        final computadores = snapshot.data!;
        return ListView.builder(
          itemCount: computadores.length,
          itemBuilder: (context, index) {
            final computador = computadores[index];
            return ListTile(
              title: Text(computador.nome),
              subtitle: Text(computador.tipo),
            );
          },
        );
      },
    );
  }
}
