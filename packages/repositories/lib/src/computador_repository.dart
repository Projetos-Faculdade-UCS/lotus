import 'package:repositories/repositories.dart';
import 'package:repositories/src/base_repository.dart';

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
}
