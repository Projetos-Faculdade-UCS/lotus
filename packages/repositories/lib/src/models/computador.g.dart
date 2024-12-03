// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'computador.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Computador _$ComputadorFromJson(Map<String, dynamic> json) => Computador(
      id: (json['id'] as num).toInt(),
      tipo: $enumDecode(_$TipoAtivoEnumMap, json['tipo']),
      nome: json['nome'] as String,
      fabricante: json['fabricante'] as String,
      emUso: json['emUso'] as bool,
      descricao: json['descricao'] as String,
      automatico: json['automatico'] as bool,
      patrimonio: (json['patrimonio'] as num).toInt(),
      sala: json['sala'] == null
          ? null
          : Sala.fromJson(json['sala'] as Map<String, dynamic>),
      relacionamentos: (json['relacionamentos'] as num).toInt(),
      responsavel: json['responsavel'] as String,
      criticidade: $enumDecode(_$CriticidadeDadosEnumMap, json['criticidade']),
      tamanhoRam: json['tamanhoRam'] as String,
      modeloCpu: json['modeloCpu'] as String,
      sistemaOperacional: json['sistemaOperacional'] as String,
      programas: (json['programas'] as List<dynamic>)
          .map((e) => Programa.fromJson(e as Map<String, dynamic>))
          .toList(),
      licencas: (json['licencas'] as List<dynamic>)
          .map((e) => LicencaSoftware.fromJson(e as Map<String, dynamic>))
          .toList(),
      valido: json['valido'] as bool,
      ultimaAtualizacao: json['ultimaAtualizacao'] == null
          ? null
          : DateTime.parse(json['ultimaAtualizacao'] as String),
      placaMae: json['placaMae'] as String,
      hd: json['hd'] as String,
      ultimoUsuarioLogado: json['ultimoUsuarioLogado'] as String?,
      numeroSerie: json['numeroSerie'] as String?,
    );

Map<String, dynamic> _$ComputadorToJson(Computador instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tipo': _$TipoAtivoEnumMap[instance.tipo]!,
      'nome': instance.nome,
      'fabricante': instance.fabricante,
      'numeroSerie': instance.numeroSerie,
      'emUso': instance.emUso,
      'descricao': instance.descricao,
      'automatico': instance.automatico,
      'patrimonio': instance.patrimonio,
      'sala': instance.sala?.toJson(),
      'relacionamentos': instance.relacionamentos,
      'responsavel': instance.responsavel,
      'ultimaAtualizacao': instance.ultimaAtualizacao?.toIso8601String(),
      'criticidade': _$CriticidadeDadosEnumMap[instance.criticidade]!,
      'tamanhoRam': instance.tamanhoRam,
      'modeloCpu': instance.modeloCpu,
      'placaMae': instance.placaMae,
      'hd': instance.hd,
      'sistemaOperacional': instance.sistemaOperacional,
      'valido': instance.valido,
      'programas': instance.programas.map((e) => e.toJson()).toList(),
      'licencas': instance.licencas.map((e) => e.toJson()).toList(),
      'ultimoUsuarioLogado': instance.ultimoUsuarioLogado,
    };

const _$TipoAtivoEnumMap = {
  TipoAtivo.computador: 'Computador',
  TipoAtivo.monitor: 'Monitor',
  TipoAtivo.impressora: 'Impressora',
};

const _$CriticidadeDadosEnumMap = {
  CriticidadeDados.alta: 'alta',
  CriticidadeDados.media: 'media',
  CriticidadeDados.baixa: 'baixa',
};
