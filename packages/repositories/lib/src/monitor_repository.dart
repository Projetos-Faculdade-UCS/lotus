import 'package:repositories/repositories.dart';
import 'package:repositories/src/base_repository.dart';

/// {@template monitor_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class MonitorRepository extends BaseAtivoRepository<Monitor> {
  /// {@macro monitor_repository}
  const MonitorRepository(super._lotusApiClient);

  @override
  String get baseUrl => '/monitores';

  @override
  TipoAtivo get tipo => TipoAtivo.monitor;

  @override
  Monitor fromJson(Map<String, dynamic> json) => Monitor.fromJson(json);
}
