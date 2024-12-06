import 'package:lotus_api_client/lotus_api_client.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/src/repository_exception.dart';

/// Classe com funcionalidades para acessar a API de salas.
class SalaRepository {
  /// {@macro base_repository}
  const SalaRepository(this.lotusApiClient);

  /// The base URL for the repository.
  String get baseUrl => '/salas/';

  /// The Lotus API client.
  final LotusApiClient lotusApiClient;

  /// Fetches the list of [Sala]s.
  Future<List<Sala>> fetchAll(
    String? nomeSala,
  ) async {
    final urlParams = nomeSala != null ? '?qs=${_cleanInput(nomeSala)}' : '';

    final response = await lotusApiClient.get<List<dynamic>>(
      '$baseUrl$urlParams',
    );

    if (response.data == null || response.statusCode != 200) {
      throw RepositoryException(
        'Failed to fetch salas',
      );
    }

    if (!response.data!.every((element) => element is Map)) {
      throw RepositoryException('Not all salas are maps');
    }

    final salasMap = response.data!.cast<Map<String, dynamic>>();

    final salas = salasMap.map((salaMap) {
      return Sala.fromJson(salaMap);
    }).toList();

    return salas;
  }

  ///Limpa a entrada do usuário.
  String _cleanInput(String input) {
    return input
        .toLowerCase()
        .replaceAll('bloco', '')
        .replaceAll('-', '')
        .trim();
  }
}
