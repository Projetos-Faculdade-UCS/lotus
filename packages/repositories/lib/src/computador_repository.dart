import 'dart:async';

import 'package:lotus_api_client/lotus_api_client.dart';
import 'package:repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

/// {@template lotus_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ComputadorRepository {
  /// {@macro lotus_repository}
  ComputadorRepository(this._lotusApiClient);

  final LotusApiClient _lotusApiClient;

  // Replace StreamController with BehaviorSubject
  final _computadoresSubject = BehaviorSubject<List<Ativo>>();

  /// Exposes a stream of [Ativo] (computadores).
  Stream<List<Ativo>> get computadoresStream => _computadoresSubject.stream;

  /// Fetches the list of [Computador]s and adds them to the stream.
  Future<void> fetchComputadores() async {
    try {
      final computadoresResponse =
          await _lotusApiClient.get<List<dynamic>>('/computadores');

      if (computadoresResponse.data == null ||
          computadoresResponse.statusCode != 200) {
        return;
      }

      if (!computadoresResponse.data!.every((element) => element is Map)) {
        return;
      }

      final computadoresMap =
          computadoresResponse.data!.cast<Map<String, dynamic>>();

      final computadores = computadoresMap.map((computadorMap) {
        return Ativo.fromJson(computadorMap);
      }).toList();

      // Emit the new data to the BehaviorSubject, which retains the latest value
      _computadoresSubject.add(computadores);
    } catch (e) {
      _computadoresSubject.addError('Failed to fetch computadores: $e');
    }
  }

  /// Fetches a [Computador] by its [id].
  Future<Computador?> getComputador(int id) async {
    final computadorResponse =
        await _lotusApiClient.get<Map<String, dynamic>>('/computadores/$id');

    if (computadorResponse.data == null ||
        computadorResponse.statusCode != 200) {
      return null;
    }

    final computadorMap = computadorResponse.data!;
    return Computador.fromJson(computadorMap);
  }

  /// Updates a [Computador] by its [id].
  Future<void> updateComputador(int id, Computador computador) async {
    await _lotusApiClient.put<Map<String, dynamic>>(
      '/computadores/$id',
      data: computador.toJson(),
    );

    // Automatically refetches and adds the new list of computadores to the stream
    unawaited(fetchComputadores());
  }

  /// Disposes of the resources used by the repository.
  void dispose() {
    _computadoresSubject.close();
  }
}
