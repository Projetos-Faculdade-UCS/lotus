import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard.g.dart';

/// {@template dashboard}
/// The dashboard data.
/// {@endtemplate}
@JsonSerializable()
class Dashboard extends Equatable {
  /// {@macro dashboard}
  const Dashboard({
    required this.ativos,
    required this.computadores,
    required this.impressoras,
    required this.monitores,
    required this.salas,
  });

  /// Converts a JSON object to a [Dashboard].
  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);

  /// The number of TI assets.
  final int ativos;

  /// The number of computers.
  final DashboardComputadores computadores;

  /// The number of printers.
  final int impressoras;

  /// The number of monitors.
  final int monitores;

  /// The number of rooms.
  final DashboardSalas salas;

  @override
  List<Object?> get props => [computadores, impressoras, monitores, salas];

  @override
  bool get stringify => true;
}

/// {@template dashboard_computadores}
/// The computer data.
/// {@endtemplate}
@JsonSerializable()
class DashboardComputadores extends Equatable {
  /// {@macro dashboard_computadores}
  const DashboardComputadores({
    required this.total,
    required this.automaticos,
    required this.manuais,
  });

  /// Converts a JSON object to a [DashboardComputadores].
  factory DashboardComputadores.fromJson(Map<String, dynamic> json) =>
      _$DashboardComputadoresFromJson(json);

  /// The total number of computers.
  final int total;

  /// The number of automatic computers.
  final int automaticos;

  /// The number of manual computers.
  final int manuais;

  @override
  List<Object?> get props => [total, automaticos, manuais];

  @override
  bool get stringify => true;
}

/// {@template dashboard_salas}
/// The room data.
/// {@endtemplate}
@JsonSerializable()
class DashboardSalas extends Equatable {
  /// {@macro dashboard_salas}
  const DashboardSalas({
    required this.total,
    required this.comAtivos,
    required this.vazias,
  });

  /// Converts a JSON object to a [DashboardSalas].
  factory DashboardSalas.fromJson(Map<String, dynamic> json) =>
      _$DashboardSalasFromJson(json);

  /// The total number of rooms.
  final int total;

  /// The number of rooms with assets.
  final int comAtivos;

  /// The number of empty rooms.
  final int vazias;

  @override
  List<Object?> get props => [total, comAtivos, vazias];

  @override
  bool get stringify => true;
}
