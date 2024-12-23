import 'package:json_annotation/json_annotation.dart';
import 'package:repositories/src/models/base/ativo.dart';
import 'package:repositories/src/models/licenca_software.dart';
import 'package:repositories/src/models/programa.dart';
import 'package:repositories/src/models/sala.dart';

part 'computador.g.dart';

/// {@template computador}
/// A computer.
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class Computador extends Ativo {
  /// {@macro computador}
  const Computador({
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
    required this.criticidade,
    required this.tamanhoRam,
    required this.modeloCpu,
    required this.sistemaOperacional,
    required this.programas,
    required this.licencas,
    required this.valido,
    required super.ultimaAtualizacao,
    required this.placaMae,
    required this.hd,
    this.ultimoUsuarioLogado,
    super.numeroSerie,
  });

  /// Converts a JSON object to a [Computador].
  factory Computador.fromJson(Map<String, dynamic> json) =>
      _$ComputadorFromJson(json);

  /// The criticality of the data.
  final CriticidadeDados criticidade;

  /// The amount of RAM.
  final String tamanhoRam;

  /// The CPU model.
  final String modeloCpu;

  /// The motherboard.
  final String placaMae;

  /// The hard drive.
  final String hd;

  /// The operating system.
  final String sistemaOperacional;

  /// Either the computer is approved.
  final bool valido;

  /// The installed programs.
  final List<Programa> programas;

  /// The software licenses.
  final List<LicencaSoftware> licencas;

  /// The logged in user.
  final String? ultimoUsuarioLogado;

  /// Converts this [Computador] to a JSON object.
  @override
  Map<String, dynamic> toJson() => _$ComputadorToJson(this);
}

/// The type of how critical the data is.
enum CriticidadeDados {
  /// High priority.
  @JsonValue('alta')
  alta('Alta prioridade', color: 0xFFB91C1C),

  /// Medium priority.
  @JsonValue('media')
  media(
    'Média prioridade',
    color: 0xFFA16207,
  ),

  /// Low priority.
  @JsonValue('baixa')
  baixa('Baixa prioridade', color: 0xFF1D4ED8);

  const CriticidadeDados(
    this.name, {
    this.color = 0xFF000000,
  });

  /// The name of the priority.
  final String name;

  /// The color of the priority.
  final int color;
}
