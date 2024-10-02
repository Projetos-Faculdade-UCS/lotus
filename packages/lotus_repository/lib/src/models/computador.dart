import 'package:json_annotation/json_annotation.dart';
import 'package:lotus_repository/src/models/base/ativo.dart';
import 'package:lotus_repository/src/models/sala.dart';

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
    required this.criticidadeDados,
    required this.tamanhoRam,
    required this.modeloCpu,
    required this.programasInstalados,
    required this.monitores,
    required this.licencas,
    required this.aprovado,
    required this.ultimaAtualizacao,
    this.usuarioLogado,
    super.numeroSerie,
  });

  /// Converts a JSON object to a [Computador].
  factory Computador.fromJson(Map<String, dynamic> json) =>
      _$ComputadorFromJson(json);

  /// The criticality of the data.
  final CriticidadeDados criticidadeDados;

  /// The amount of RAM.
  final String tamanhoRam;

  /// The CPU model.
  final String modeloCpu;

  /// The installed programs.
  final List<String> programasInstalados;

  /// The monitors.
  final List<String> monitores;

  /// The licenses.
  final List<String> licencas;

  /// The logged in user.
  final String? usuarioLogado;

  /// Either the computer is approved.
  final bool aprovado;

  /// The last update.
  final DateTime ultimaAtualizacao;

  /// Converts this [Computador] to a JSON object.
  @override
  Map<String, dynamic> toJson() => _$ComputadorToJson(this);

  @override
  List<Object?> get props => [
        ...super.props,
        criticidadeDados,
        tamanhoRam,
        modeloCpu,
        programasInstalados,
        monitores,
        licencas,
        usuarioLogado,
        aprovado,
        ultimaAtualizacao,
      ];
}

/// The criticality of the data.
enum CriticidadeDados {
  /// Low criticality.
  baixa(name: 'Baixa'),

  /// Medium criticality.
  media(name: 'Média'),

  /// High criticality.
  alta(name: 'Alta');

  const CriticidadeDados({
    required this.name,
  });

  /// The verbose name of the criticality.
  final String name;

  @override
  String toString() => name;
}
