import 'package:repositories/repositories.dart';
import 'package:repositories/src/base_repository.dart';

/// {@template impressora_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ImpressoraRepository extends BaseAtivoRepository<Ativo> {
  /// {@macro impressora_repository}
  const ImpressoraRepository(super._lotusApiClient);

  @override
  String get baseUrl => '/computadores';

  @override
  TipoAtivo get tipo => TipoAtivo.computador;

  @override
  Computador fromJson(Map<String, dynamic> json) => Computador.fromJson(json);
}
