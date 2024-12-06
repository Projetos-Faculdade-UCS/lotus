import 'package:json_annotation/json_annotation.dart';
import 'package:repositories/repositories.dart';

part 'impressora.g.dart';

/// {@template computador}
/// A computer.
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class Impressora extends Ativo {
  /// {@macro computador}
  const Impressora({
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

  /// Converts a JSON object to a [Impressora].
  factory Impressora.fromJson(Map<String, dynamic> json) =>
      _$ImpressoraFromJson(json);

  /// Converts this [Impressora] to a JSON object.
  @override
  Map<String, dynamic> toJson() => _$ImpressoraToJson(this);
}
