import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'licenca_software.g.dart';

@JsonSerializable(explicitToJson: true)
class LicencaSoftware extends Equatable {
  const LicencaSoftware({
    required this.id,
    required this.nome,
    required this.dataExpiracao,
    required this.quantidade,
    required this.quantidadeEmUso,
    required this.descricao,
  });

  factory LicencaSoftware.fromJson(Map<String, dynamic> json) =>
      _$LicencaSoftwareFromJson(json);

  final int id;

  final String nome;

  final DateTime dataExpiracao;

  final int quantidade;

  final int quantidadeEmUso;

  final String descricao;

  Map<String, dynamic> toJson() => _$LicencaSoftwareToJson(this);

  @override
  List<Object?> get props => [
        id,
      ];

  @override
  bool get stringify => true;
}
