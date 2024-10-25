import 'package:lotus_api_client/lotus_api_client.dart';
import 'package:repositories/repositories.dart';

/// {@template base_repository}
/// A base ativo repository class.
/// {@endtemplate}
abstract class BaseAtivoRepository<T extends Ativo> {
  /// {@macro base_repository}
  const BaseAtivoRepository(this.lotusApiClient);

  /// The base URL for the repository.
  abstract final String baseUrl;

  /// The type of ativo this repository manages.
  abstract final TipoAtivo tipo;

  /// The Lotus API client.
  final LotusApiClient lotusApiClient;

  /// Converts a JSON object to a [T].
  T fromJson(Map<String, dynamic> json);

  /// Fetches the list of [Ativo]s.
  Future<List<Ativo>> fetchAll() async {
    final response = await lotusApiClient.get<List<dynamic>>(baseUrl);

    if (response.data == null || response.statusCode != 200) {
      throw RepositoryException(
        'Failed to fetch ${tipo.pluralName}',
      );
    }

    if (!response.data!.every((element) => element is Map)) {
      throw RepositoryException('Not all ${tipo.pluralName} are maps');
    }

    final ativosMap = response.data!.cast<Map<String, dynamic>>();

    final ativos = ativosMap.map((ativoMap) {
      return Ativo.fromJson(ativoMap);
    }).toList();

    return ativos;
  }

  /// Fetches a [T] by its [id].
  Future<T?> getById(int id) async {
    final computadorResponse =
        await lotusApiClient.get<Map<String, dynamic>>('$baseUrl/$id');

    if (computadorResponse.data == null ||
        computadorResponse.statusCode != 200) {
      return null;
    }

    final computadorMap = computadorResponse.data!;

    return fromJson(computadorMap);
  }

  /// Updates a [T].
  Future<void> update(T ativo) async {
    await lotusApiClient.put<Map<String, dynamic>>(
      '$baseUrl/${ativo.id}',
      data: ativo.toJson(),
    );
  }
}

/// {@template base_ativo_repository_exception}
/// Exception thrown by the [ComputadorRepository].
/// {@endtemplate}
class RepositoryException implements Exception {
  /// {@macro base_ativo_repository_exception}
  RepositoryException(this.message);

  /// Message describing the exception.
  final String message;

  @override
  String toString() => 'RepositoryException: $message';
}
