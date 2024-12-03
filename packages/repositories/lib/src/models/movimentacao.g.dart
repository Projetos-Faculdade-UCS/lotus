// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimentacao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movimentacao _$MovimentacaoFromJson(Map<String, dynamic> json) => Movimentacao(
      id: (json['id'] as num).toInt(),
      salaAtual: Sala.fromJson(json['salaAtual'] as Map<String, dynamic>),
      data: DateTime.parse(json['data'] as String),
      motivo: json['motivo'] as String,
    );

Map<String, dynamic> _$MovimentacaoToJson(Movimentacao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'salaAtual': instance.salaAtual,
      'data': instance.data.toIso8601String(),
      'motivo': instance.motivo,
    };
