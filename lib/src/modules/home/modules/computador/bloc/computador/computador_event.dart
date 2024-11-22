part of 'computador_bloc.dart';

/// {@template computadores_event}
/// Eventos do bloc de computadores.
/// {@endtemplate}
sealed class ComputadorEvent extends Equatable {
  const ComputadorEvent();

  @override
  List<Object> get props => [];
}

/// Evento para buscar a lista de computadores.
final class GetComputador extends ComputadorEvent {
  /// {@macro computadores_fetch}
  const GetComputador(this.id);

  /// ID do computador.
  final int id;
}

/// Evento para buscar a lista de computadores.
final class FetchComputadores extends ComputadorEvent {}
