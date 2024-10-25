// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'licenca_software.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LicencaSoftware _$LicencaSoftwareFromJson(Map<String, dynamic> json) =>
    LicencaSoftware(
      id: (json['id'] as num).toInt(),
      nome: json['nome'] as String,
      dataExpiracao: DateTime.parse(json['dataExpiracao'] as String),
      quantidade: (json['quantidade'] as num).toInt(),
      quantidadeEmUso: (json['quantidadeEmUso'] as num).toInt(),
      descricao: json['descricao'] as String,
    );

Map<String, dynamic> _$LicencaSoftwareToJson(LicencaSoftware instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'dataExpiracao': instance.dataExpiracao.toIso8601String(),
      'quantidade': instance.quantidade,
      'quantidadeEmUso': instance.quantidadeEmUso,
      'descricao': instance.descricao,
    };
