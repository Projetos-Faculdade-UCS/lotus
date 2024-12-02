import 'package:repositories/repositories.dart';
import 'package:repositories/src/models/movimentacao.dart';
import 'package:repositories/src/repository_exception.dart';

/// {@template computador_repository}
/// Repository which manages [Computador]s.
/// {@endtemplate}
class ComputadorRepository extends BaseAtivoRepository<Computador> {
  /// {@macro computador_repository}
  const ComputadorRepository(super._lotusApiClient);

  @override
  String get baseUrl => '/computadores';

  @override
  TipoAtivo get tipo => TipoAtivo.computador;

  @override
  Computador fromJson(Map<String, dynamic> json) => Computador.fromJson(json);

  /// Atualiza a sala de um [Computador].
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

  /// Busca o histórico de movimentações de um [Computador].
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
