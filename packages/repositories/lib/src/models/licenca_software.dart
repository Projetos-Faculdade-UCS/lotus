import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'licenca_software.g.dart';

/// {@template licenca_software}
/// Modelo que representa uma licença de software.
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class LicencaSoftware extends Equatable {
  /// {@macro licenca_software}
  const LicencaSoftware({
    required this.id,
    required this.nome,
    required this.dataExpiracao,
    required this.quantidade,
    required this.quantidadeEmUso,
    required this.descricao,
  });

  /// Cria uma instância de [LicencaSoftware] a partir de um JSON.
  factory LicencaSoftware.fromJson(Map<String, dynamic> json) =>
      _$LicencaSoftwareFromJson(json);

  /// O identificador da licença.
  final int id;

  /// O nome da licença.
  final String nome;

  /// A data de expiração da licença.
  final DateTime dataExpiracao;

  /// A quantidade de licenças disponíveis.
  final int quantidade;

  /// A quantidade de licenças em uso.
  final int quantidadeEmUso;

  /// A descrição da licença.
  final String descricao;

  /// Cria um JSON a partir de uma instância de [LicencaSoftware].
  Map<String, dynamic> toJson() => _$LicencaSoftwareToJson(this);

  @override
  List<Object?> get props => [
        id,
      ];

  @override
  bool get stringify => true;
}
