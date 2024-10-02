import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bloco.g.dart';

@JsonSerializable()
class Bloco extends Equatable {
  const Bloco({
    required this.id,
    required this.nome,
    required this.cidade,
    required this.campus,
  });

  factory Bloco.fromJson(Map<String, dynamic> json) => _$BlocoFromJson(json);
  final int id;
  final String nome;
  final String cidade;
  final String campus;
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
