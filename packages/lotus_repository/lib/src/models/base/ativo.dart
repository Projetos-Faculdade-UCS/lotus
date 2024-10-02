import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lotus_repository/src/models/sala.dart';

part 'ativo.g.dart';

/// {@template ativo}
/// An IT asset.
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class Ativo extends Equatable {
  /// {@macro ativo}
  const Ativo({
    required this.id,
    required this.tipo,
    required this.nome,
    required this.fabricante,
    required this.emUso,
    required this.descricao,
    required this.automatico,
    required this.patrimonio,
    required this.sala,
    required this.relacionamentos,
    required this.responsavel,
    this.numeroSerie,
  });

  /// Converts a JSON object to a [Ativo].
  factory Ativo.fromJson(Map<String, dynamic> json) => _$AtivoFromJson(json);

  /// The unique identifier of the IT asset.
  final int id;

  /// The type of the IT asset.
  final String tipo;

  /// The name of the IT asset.
  final String nome;

  /// The manufacturer of the IT asset.
  final String fabricante;

  /// The serial number of the IT asset.
  final String? numeroSerie;

  /// Whether the IT asset is in use.
  final bool emUso;

  /// A description of the IT asset.
  final String descricao;

  /// Whether the IT asset is automatically updated.
  final bool automatico;

  /// The patrimony of the IT asset.
  final int patrimonio;

  /// The room where the IT asset is located.
  final Sala sala;

  /// The number of relationships of the IT asset.
  final int relacionamentos;

  /// The responsible for the IT asset.
  final String responsavel;

  /// Converts this [Ativo] to a JSON object.
  Map<String, dynamic> toJson() => _$AtivoToJson(this);

  @override
  List<Object?> get props => [
        id,
        tipo,
        nome,
        fabricante,
        numeroSerie,
        emUso,
        descricao,
        automatico,
        patrimonio,
        sala,
        relacionamentos,
        responsavel,
      ];

  @override
  bool get stringify => true;

  /// Returns a copy of this Ativo with the given fields updated.
  Ativo copyWith({
    int? id,
    String? tipo,
    String? nome,
    String? fabricante,
    String? numeroSerie,
    bool? emUso,
    String? descricao,
    bool? automatico,
    int? patrimonio,
    Sala? sala,
    int? relacionamentos,
    String? responsavel,
  }) {
    return Ativo(
      id: id ?? this.id,
      tipo: tipo ?? this.tipo,
      nome: nome ?? this.nome,
      fabricante: fabricante ?? this.fabricante,
      numeroSerie: numeroSerie ?? this.numeroSerie,
      emUso: emUso ?? this.emUso,
      descricao: descricao ?? this.descricao,
      automatico: automatico ?? this.automatico,
      patrimonio: patrimonio ?? this.patrimonio,
      sala: sala ?? this.sala,
      relacionamentos: relacionamentos ?? this.relacionamentos,
      responsavel: responsavel ?? this.responsavel,
    );
  }
}
