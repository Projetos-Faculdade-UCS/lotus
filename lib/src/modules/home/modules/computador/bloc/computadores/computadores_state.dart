part of 'computadores_bloc.dart';

/// {@template computadores_event}
/// Eventos do bloc de computadores.
/// {@endtemplate}
sealed class ComputadoresState extends Equatable {
  const ComputadoresState();

  @override
  List<Object> get props => [];
}

/// Estado inicial do bloc de computadores.
final class ComputadoresInitial extends ComputadoresState {}

/// Estado de carregamento da lista de computadores.
final class ComputadoresLoading extends ComputadoresState {}

/// Estado de sucesso ao carregar a lista de computadores.
final class ComputadoresSuccess extends ComputadoresState {
  /// {@macro computadores_success}
  const ComputadoresSuccess(this.computadores);

  /// Lista de computadores.
  final Stream<List<Ativo>> computadores;

  @override
  List<Object> get props => [computadores];
}

/// Estado de falha ao carregar a lista de computadores.
final class ComputadoresFailure extends ComputadoresState {}
