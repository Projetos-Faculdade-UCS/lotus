part of 'monitores_bloc.dart';

/// {@template monitores_event}
/// Eventos relacionados a monitores.
/// {@endtemplate}
sealed class MonitoresEvent extends Equatable {
  const MonitoresEvent();

  @override
  List<Object> get props => [];
}

/// Evento para buscar as monitores.
class GetAllMonitores extends MonitoresEvent {}

/// Evento para buscar um monitor.
class GetMonitor extends MonitoresEvent {
  /// {@macro monitores_get}
  const GetMonitor(this.id);

  /// ID do monitor.
  final int id;
}
