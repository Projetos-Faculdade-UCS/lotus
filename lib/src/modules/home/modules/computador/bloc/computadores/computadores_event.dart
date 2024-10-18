part of 'computadores_bloc.dart';

/// {@template computadores_event}
/// Eventos do bloc de computadores.
/// {@endtemplate}
sealed class ComputadoresEvent extends Equatable {
  const ComputadoresEvent();

  @override
  List<Object> get props => [];
}

/// Evento para buscar a lista de computadores.
final class ComputadoresFetch extends ComputadoresEvent {}
