import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:repositories/repositories.dart';

part 'movimentacao.g.dart';

/// {@template movimentacao}
/// Uma objeto de historico de movimentação de um ativo.
/// {@endtemplate}
@JsonSerializable()
class Movimentacao extends Equatable {
  /// {@macro movimentacao}
  const Movimentacao({
    required this.id,
    required this.salaAtual,
    required this.data,
    required this.motivo,
  });

  /// Converts a JSON object to a [Movimentacao].
  factory Movimentacao.fromJson(Map<String, dynamic> json) =>
      _$MovimentacaoFromJson(json);

  /// The unique identifier of the movimentacao.
  final int id;

  /// The room where the asset is located.
  final Sala? salaAtual;

  /// The date of the movimentacao.
  final DateTime data;

  /// The reason for the movimentacao.
  final String motivo;

  /// Converts this [Movimentacao] to a JSON object.
  Map<String, dynamic> toJson() => _$MovimentacaoToJson(this);

  @override
  List<Object?> get props => [id, salaAtual, data, motivo];

  @override
  bool get stringify => true;

  // /// Returns a copy of this Sala with the given fields updated.
  Movimentacao copyWith({
    int? id,
    Sala? salaAtual,
    DateTime? data,
    String? motivo,
  }) {
    return Movimentacao(
      id: id ?? this.id,
      salaAtual: salaAtual ?? this.salaAtual,
      data: data ?? this.data,
      motivo: motivo ?? this.motivo,
    );
  }
}
