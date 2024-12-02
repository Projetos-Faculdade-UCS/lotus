import 'package:repositories/repositories.dart';

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
}
