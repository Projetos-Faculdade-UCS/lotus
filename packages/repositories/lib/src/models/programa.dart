import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'programa.g.dart';

@JsonSerializable(explicitToJson: true)
class Programa extends Equatable {
  const Programa({
    required this.id,
    required this.nome,
    required this.versao,
  });

  factory Programa.fromJson(Map<String, dynamic> json) =>
      _$ProgramaFromJson(json);

  final int id;

  final String nome;

  final String versao;

  Map<String, dynamic> toJson() => _$ProgramaToJson(this);

  @override
  List<Object?> get props => [
        id,
      ];

  @override
  bool get stringify => true;
}
