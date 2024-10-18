// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bloco.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bloco _$BlocoFromJson(Map<String, dynamic> json) => Bloco(
      id: (json['id'] as num).toInt(),
      nome: json['nome'] as String,
      cidade: json['cidade'] as String,
      campus: json['campus'] as String,
    );

Map<String, dynamic> _$BlocoToJson(Bloco instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'cidade': instance.cidade,
      'campus': instance.campus,
    };
