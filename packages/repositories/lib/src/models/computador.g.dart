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
      sala: Sala.fromJson(json['sala'] as Map<String, dynamic>),
      relacionamentos: (json['relacionamentos'] as num).toInt(),
      responsavel: json['responsavel'] as String,
      criticidadeDados:
          $enumDecode(_$CriticidadeDadosEnumMap, json['criticidadeDados']),
      tamanhoRam: json['tamanhoRam'] as String,
      modeloCpu: json['modeloCpu'] as String,
      programasInstalados: (json['programasInstalados'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      monitores:
          (json['monitores'] as List<dynamic>).map((e) => e as String).toList(),
      licencas:
          (json['licencas'] as List<dynamic>).map((e) => e as String).toList(),
      aprovado: json['aprovado'] as bool,
      ultimaAtualizacao: json['ultimaAtualizacao'] == null
          ? null
          : DateTime.parse(json['ultimaAtualizacao'] as String),
      usuarioLogado: json['usuarioLogado'] as String?,
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
      'sala': instance.sala.toJson(),
      'relacionamentos': instance.relacionamentos,
      'responsavel': instance.responsavel,
      'ultimaAtualizacao': instance.ultimaAtualizacao?.toIso8601String(),
      'criticidadeDados': _$CriticidadeDadosEnumMap[instance.criticidadeDados]!,
      'tamanhoRam': instance.tamanhoRam,
      'modeloCpu': instance.modeloCpu,
      'programasInstalados': instance.programasInstalados,
      'monitores': instance.monitores,
      'licencas': instance.licencas,
      'usuarioLogado': instance.usuarioLogado,
      'aprovado': instance.aprovado,
    };

const _$TipoAtivoEnumMap = {
  TipoAtivo.computador: 'Computador',
  TipoAtivo.monitor: 'Monitor',
  TipoAtivo.impressora: 'Impressora',
  TipoAtivo.licencaSoftware: 'licencaSoftware',
};

const _$CriticidadeDadosEnumMap = {
  CriticidadeDados.baixa: 'baixa',
  CriticidadeDados.media: 'media',
  CriticidadeDados.alta: 'alta',
};
