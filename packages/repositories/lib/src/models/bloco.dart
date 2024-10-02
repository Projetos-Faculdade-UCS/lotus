import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bloco.g.dart';

/// {@template bloco}
/// A building in a campus.
/// {@endtemplate}
@JsonSerializable()
class Bloco extends Equatable {
  /// {@macro bloco}
  const Bloco({
    required this.id,
    required this.nome,
    required this.cidade,
    required this.campus,
  });

  /// Converts a JSON object to a [Bloco].
  factory Bloco.fromJson(Map<String, dynamic> json) => _$BlocoFromJson(json);

  /// The unique identifier of the building.
  final int id;

  /// The name of the building.
  final String nome;

  /// The city where the building is located.
  final String cidade;

  /// The campus where the building is located.
  final String campus;

  /// Converts this [Bloco] to a JSON object.
  Map<String, dynamic> toJson() => _$BlocoToJson(this);

  @override
  List<Object?> get props => [id, nome, cidade, campus];

  @override
  bool get stringify => true;

  /// Returns a copy of this Bloco with the given fields updated.
  Bloco copyWith({
    int? id,
    String? nome,
    String? cidade,
    String? campus,
  }) {
    return Bloco(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      cidade: cidade ?? this.cidade,
      campus: campus ?? this.campus,
    );
  }
}
