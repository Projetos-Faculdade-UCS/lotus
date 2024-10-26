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
class MonitoresFetch extends MonitoresEvent {}
