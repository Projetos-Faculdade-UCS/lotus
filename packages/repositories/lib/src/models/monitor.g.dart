// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Monitor _$MonitorFromJson(Map<String, dynamic> json) => Monitor(
      id: (json['id'] as num).toInt(),
      tipo: $enumDecode(_$TipoAtivoEnumMap, json['tipo']),
      nome: json['nome'] as String,
      fabricante: json['fabricante'] as String,
      emUso: json['emUso'] as bool,
      descricao: json['descricao'] as String,
      automatico: json['automatico'] as bool,
      patrimonio: (json['patrimonio'] as num).toInt(),
      sala: Sala.fromJson(json['sala'] as Map<String, dynamic>),
      relacionamentos: (json['relacionamentos'] as num).toInt(),
      responsavel: json['responsavel'] as String,
      ultimaAtualizacao: json['ultimaAtualizacao'] == null
          ? null
          : DateTime.parse(json['ultimaAtualizacao'] as String),
      resolucao: json['resolucao'] as String? ?? '',
      numeroSerie: json['numeroSerie'] as String?,
    );

Map<String, dynamic> _$MonitorToJson(Monitor instance) => <String, dynamic>{
      'id': instance.id,
      'tipo': _$TipoAtivoEnumMap[instance.tipo]!,
      'nome': instance.nome,
      'fabricante': instance.fabricante,
      'numeroSerie': instance.numeroSerie,
      'emUso': instance.emUso,
      'descricao': instance.descricao,
      'automatico': instance.automatico,
      'patrimonio': instance.patrimonio,
      'sala': instance.sala.toJson(),
      'relacionamentos': instance.relacionamentos,
      'responsavel': instance.responsavel,
      'ultimaAtualizacao': instance.ultimaAtualizacao?.toIso8601String(),
      'resolucao': instance.resolucao,
    };

const _$TipoAtivoEnumMap = {
  TipoAtivo.computador: 'Computador',
  TipoAtivo.monitor: 'Monitor',
  TipoAtivo.impressora: 'Impressora',
};
