part of 'computador_bloc.dart';

/// {@template computadores_event}
/// Eventos do bloc de computadores.
/// {@endtemplate}
sealed class ComputadorState extends Equatable {
  const ComputadorState();

  @override
  List<Object> get props => [];
}

/// Estado inicial do bloc de computadores.
final class ComputadorInitial extends ComputadorState {}

/// Estado de carregamento da lista de computadores.
final class ComputadorLoading extends ComputadorState {}

/// Estado de sucesso ao carregar a lista de computadores.
final class ComputadorSuccess extends ComputadorState {
  /// {@macro computadores_success}
  const ComputadorSuccess(this.computador);

  /// Lista de computadores.
  final Computador computador;

  @override
  List<Object> get props => [computador];
}

/// Estado de falha ao carregar a lista de computadores.
final class ComputadorFailure extends ComputadorState {}
