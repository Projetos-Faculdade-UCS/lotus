import 'dart:async';

import 'package:lotus_api_client/lotus_api_client.dart';
import 'package:repositories/repositories.dart';

/// {@template lotus_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ComputadorRepository {
  /// {@macro lotus_repository}
  ComputadorRepository(this._lotusApiClient);

  final LotusApiClient _lotusApiClient;

  /// Fetches the list of [Computador]s and adds them to the stream.
  Future<List<Ativo>> fetchComputadores() async {
    final computadoresResponse =
        await _lotusApiClient.get<List<dynamic>>('/computadores');

    if (computadoresResponse.data == null ||
        computadoresResponse.statusCode != 200) {
      throw ComputadorRepositoryException('Failed to fetch computadores');
    }

    if (!computadoresResponse.data!.every((element) => element is Map)) {
      throw ComputadorRepositoryException('Not all computadores are maps');
    }

    final computadoresMap =
        computadoresResponse.data!.cast<Map<String, dynamic>>();

    final computadores = computadoresMap.map((computadorMap) {
      return Ativo.fromJson(computadorMap);
    }).toList();

    return computadores;
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
}

/// {@template computador_repository_exception}
/// Exception thrown by the [ComputadorRepository].
/// {@endtemplate}
class ComputadorRepositoryException implements Exception {
  /// {@macro computador_repository_exception}
  ComputadorRepositoryException(this.message);

  /// Message describing the exception.
  final String message;

  @override
  String toString() => 'ComputadorRepositoryException: $message';
}
