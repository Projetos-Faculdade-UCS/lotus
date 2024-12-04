import 'package:repositories/repositories.dart';
import 'package:repositories/src/repository_exception.dart';

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

  /// Atualiza a sala de um [Computador].
  @override
  Future<Computador?> updateSala(int computadorId, int salaId) async {
    final computadorResponse = await lotusApiClient.patch<Map<String, dynamic>>(
      '$baseUrl/$computadorId/',
      data: {
        'local': salaId,
      },
    );
    if (computadorResponse.data == null ||
        computadorResponse.statusCode != 200) {
      return null;
    }

    final computadorMap = computadorResponse.data!;

    return fromJson(computadorMap);
  }

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
    final response = await lotusApiClient.post<void>(
      '$baseUrl/validar/',
      data: {'ids': ids},
    );

    if (response.statusCode != 200) {
      throw RepositoryException('Failed to validate computadores');
    }
  }

  /// Busca o histórico de movimentações de um [Computador].
  @override
  Future<List<Movimentacao>> getHistoricoMovimentacoes(int computadorId) async {
    final response = await lotusApiClient.get<List<dynamic>>(
      '$baseUrl/$computadorId/movimentacoes/',
    );

    if (response.data == null || response.statusCode != 200) {
      throw RepositoryException(
        'Failed to fetch movimentacoes',
      );
    }

    if (!response.data!.every((element) => element is Map)) {
      throw RepositoryException('Not all movimentacoes are maps');
    }

    final movimentacoesMap = response.data!.cast<Map<String, dynamic>>();

    final movimentacoes = movimentacoesMap.map((movimentacaoMap) {
      return Movimentacao.fromJson(movimentacaoMap);
    }).toList();

    return movimentacoes;
  }
}
