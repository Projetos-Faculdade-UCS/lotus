// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => Dashboard(
      computadores: DashboardComputadores.fromJson(
          json['computadores'] as Map<String, dynamic>),
      impressoras: (json['impressoras'] as num).toInt(),
      monitores: (json['monitores'] as num).toInt(),
      salas: DashboardSalas.fromJson(json['salas'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardToJson(Dashboard instance) => <String, dynamic>{
      'computadores': instance.computadores,
      'impressoras': instance.impressoras,
      'monitores': instance.monitores,
      'salas': instance.salas,
    };

DashboardComputadores _$DashboardComputadoresFromJson(
        Map<String, dynamic> json) =>
    DashboardComputadores(
      total: (json['total'] as num).toInt(),
      automaticos: (json['automaticos'] as num).toInt(),
      manuais: (json['manuais'] as num).toInt(),
    );

Map<String, dynamic> _$DashboardComputadoresToJson(
        DashboardComputadores instance) =>
    <String, dynamic>{
      'total': instance.total,
      'automaticos': instance.automaticos,
      'manuais': instance.manuais,
    };

DashboardSalas _$DashboardSalasFromJson(Map<String, dynamic> json) =>
    DashboardSalas(
      total: (json['total'] as num).toInt(),
      comAtivos: (json['comAtivos'] as num).toInt(),
      vazias: (json['vazias'] as num).toInt(),
    );

Map<String, dynamic> _$DashboardSalasToJson(DashboardSalas instance) =>
    <String, dynamic>{
      'total': instance.total,
      'comAtivos': instance.comAtivos,
      'vazias': instance.vazias,
    };
