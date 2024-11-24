import 'package:repositories/repositories.dart';
import 'package:repositories/src/base_repository.dart';

/// {@template computador_repository}
/// Repository which manages [Computador]s.
/// {@endtemplate}
class ComputadorRepository extends BaseAtivoRepository<Computador> {
  /// {@macro computador_repository}
  const ComputadorRepository(super.lotusApiClient);

  @override
  String get baseUrl => '/computadores';

  @override
  TipoAtivo get tipo => TipoAtivo.computador;

  @override
  Computador fromJson(Map<String, dynamic> json) => Computador.fromJson(json);

  /// Fetches the list of pending [Computador]s.
  Future<List<Ativo>> fetchPendentes() async {
    final path = lotusApiClient.baseUrl.contains('mockaroo')
        ? '/all-pendentes'
        : '/pendentes-validacao';
    final response = await lotusApiClient.get<List<dynamic>>('$baseUrl/$path');

    if (response.data == null || response.statusCode != 200) {
      throw RepositoryException(
        'Failed to fetch computadores pendentes',
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

  /// Validates the [Computador]s with the given [ids].
  Future<void> validate(List<int> ids) async {
    final futures = ids.map((id) {
      return lotusApiClient.patch<void>(
        '$baseUrl/$id/',
        data: {'valido': true},
      );
    });

    final responses = await Future.wait(futures);

    if (responses.any((response) => response.statusCode != 200)) {
      throw RepositoryException('Failed to validate computadores');
    }

    return;
  }
}
