// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sala.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sala _$SalaFromJson(Map<String, dynamic> json) => Sala(
      id: (json['id'] as num).toInt(),
      nome: json['nome'] as String,
      bloco: Bloco.fromJson(json['bloco'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SalaToJson(Sala instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'bloco': instance.bloco,
    };
