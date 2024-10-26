import 'package:repositories/repositories.dart';
import 'package:repositories/src/base_repository.dart';

/// {@template impressora_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ImpressoraRepository extends BaseAtivoRepository<Impressora> {
  /// {@macro impressora_repository}
  const ImpressoraRepository(super._lotusApiClient);

  @override
  String get baseUrl => '/impressoras';

  @override
  TipoAtivo get tipo => TipoAtivo.impressora;

  @override
  Impressora fromJson(Map<String, dynamic> json) => Impressora.fromJson(json);
}
