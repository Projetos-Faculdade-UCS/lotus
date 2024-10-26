import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'programa.g.dart';

/// {@template programa}
/// Modelo que representa um programa.
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class Programa extends Equatable {
  /// {@macro programa}
  const Programa({
    required this.id,
    required this.nome,
    required this.versao,
  });

  /// Cria uma instância de [Programa] a partir de um JSON.
  factory Programa.fromJson(Map<String, dynamic> json) =>
      _$ProgramaFromJson(json);

  /// O identificador do programa.
  final int id;

  /// O nome do programa.
  final String nome;

  /// A versão do programa.
  final String versao;

  /// Cria um JSON a partir de uma instância de [Programa].
  Map<String, dynamic> toJson() => _$ProgramaToJson(this);

  @override
  List<Object?> get props => [
        id,
      ];

  @override
  bool get stringify => true;
}
