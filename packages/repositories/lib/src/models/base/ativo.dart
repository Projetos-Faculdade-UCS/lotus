import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:repositories/src/models/sala.dart';

part 'ativo.g.dart';

/// {@template ativo}
/// An IT asset.
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class Ativo extends Equatable {
  /// {@macro ativo}
  const Ativo({
    required this.id,
    required this.tipo,
    required this.nome,
    required this.fabricante,
    required this.emUso,
    required this.descricao,
    required this.automatico,
    required this.patrimonio,
    required this.sala,
    required this.relacionamentos,
    required this.responsavel,
    this.numeroSerie,
    this.ultimaAtualizacao,
  });

  /// Converts a JSON object to a [Ativo].
  factory Ativo.fromJson(Map<String, dynamic> json) => _$AtivoFromJson(json);

  /// The unique identifier of the IT asset.
  final int id;

  /// The type of the IT asset.
  final TipoAtivo tipo;

  /// The name of the IT asset.
  final String nome;

  /// The manufacturer of the IT asset.
  final String fabricante;

  /// The serial number of the IT asset.
  final String? numeroSerie;

  /// Whether the IT asset is in use.
  final bool emUso;

  /// A description of the IT asset.
  final String descricao;

  /// Whether the IT asset is automatically updated.
  final bool automatico;

  /// The patrimony of the IT asset.
  final int patrimonio;

  /// The room where the IT asset is located.
  final Sala? sala;

  /// The number of relationships of the IT asset.
  final int relacionamentos;

  /// The responsible for the IT asset.
  final String responsavel;

  /// The last update of the IT asset.
  final DateTime? ultimaAtualizacao;

  /// Converts this [Ativo] to a JSON object.
  Map<String, dynamic> toJson() => _$AtivoToJson(this);

  @override
  List<Object?> get props => [
        id,
      ];

  @override
  bool get stringify => true;

  /// Returns a copy of this Ativo with the given fields updated.
  Ativo copyWith({
    int? id,
    TipoAtivo? tipo,
    String? nome,
    String? fabricante,
    String? numeroSerie,
    bool? emUso,
    String? descricao,
    bool? automatico,
    int? patrimonio,
    Sala? sala,
    int? relacionamentos,
    String? responsavel,
    DateTime? ultimaAtualizacao,
  }) {
    return Ativo(
      id: id ?? this.id,
      tipo: tipo ?? this.tipo,
      nome: nome ?? this.nome,
      fabricante: fabricante ?? this.fabricante,
      numeroSerie: numeroSerie ?? this.numeroSerie,
      emUso: emUso ?? this.emUso,
      descricao: descricao ?? this.descricao,
      automatico: automatico ?? this.automatico,
      patrimonio: patrimonio ?? this.patrimonio,
      sala: sala ?? this.sala,
      relacionamentos: relacionamentos ?? this.relacionamentos,
      responsavel: responsavel ?? this.responsavel,
      ultimaAtualizacao: ultimaAtualizacao ?? this.ultimaAtualizacao,
    );
  }
}

/// The type of an IT asset.
enum TipoAtivo {
  /// A computer.
  @JsonValue('Computador')
  computador(
    'assets/ativos/computador.svg',
    name: 'Computador',
    pluralName: 'Computadores',
    route: '/computadores',
  ),

  /// A monitor.
  @JsonValue('Monitor')
  monitor(
    'assets/ativos/monitor.svg',
    name: 'Monitor',
    pluralName: 'Monitores',
    route: '/monitores',
  ),

  /// A printer.
  @JsonValue('Impressora')
  impressora(
    'assets/ativos/impressora.svg',
    name: 'Impressora',
    pluralName: 'Impressoras',
    route: '/impressoras',
  );

  const TipoAtivo(
    this.icon, {
    required this.name,
    required this.pluralName,
    required this.route,
  });

  /// The icon of the IT asset type.
  final String icon;

  /// The name of the IT asset type.
  final String name;

  /// The plural name of the IT asset type.
  final String pluralName;

  /// The route of the type.
  final String route;
}
