import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lotus_repository/src/models/bloco.dart';

part 'sala.g.dart';

/// {@template sala}
/// A room in a building of a campus.
/// {@endtemplate}
@JsonSerializable()
class Sala extends Equatable {
  /// {@macro sala}
  const Sala({
    required this.id,
    required this.nome,
    required this.bloco,
  });

  /// Converts a JSON object to a [Sala].
  factory Sala.fromJson(Map<String, dynamic> json) => _$SalaFromJson(json);

  /// The unique identifier of the room.
  final int id;

  /// The name of the room.
  final String nome;

  /// The building where the room is located.
  final Bloco bloco;

  /// Converts this [Sala] to a JSON object.
  Map<String, dynamic> toJson() => _$SalaToJson(this);

  @override
  List<Object?> get props => [id, nome, bloco];

  @override
  bool get stringify => true;

  /// Returns a copy of this Sala with the given fields updated.
  Sala copyWith({
    int? id,
    String? nome,
    Bloco? bloco,
  }) {
    return Sala(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      bloco: bloco ?? this.bloco,
    );
  }
}
