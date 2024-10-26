import 'package:json_annotation/json_annotation.dart';
import 'package:repositories/repositories.dart';

part 'monitor.g.dart';

/// {@template monitor}
/// A computer.
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class Monitor extends Ativo {
  /// {@macro monitor}
  const Monitor({
    required super.id,
    required super.tipo,
    required super.nome,
    required super.fabricante,
    required super.emUso,
    required super.descricao,
    required super.automatico,
    required super.patrimonio,
    required super.sala,
    required super.relacionamentos,
    required super.responsavel,
    required super.ultimaAtualizacao,
    super.numeroSerie,
  });

  /// Converts a JSON object to a [Monitor].
  factory Monitor.fromJson(Map<String, dynamic> json) =>
      _$MonitorFromJson(json);

  /// Converts this [Monitor] to a JSON object.
  @override
  Map<String, dynamic> toJson() => _$MonitorToJson(this);
}
