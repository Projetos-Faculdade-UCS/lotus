import 'package:equatable/equatable.dart';
import 'package:repositories/repositories.dart';

/// {@template generic_state}
/// Estados genéricos para alguns endpoints mennos complexos.
/// {@endtemplate}
sealed class GenericState extends Equatable {
  const GenericState();

  @override
  List<Object> get props => [];
}

/// Estado inicial genérico.
final class GenericInitial extends GenericState {}

/// Estado de carregamento genérico.
final class GenericLoading extends GenericState {}

/// Estado de erro genérico.
final class GenericError extends GenericState {}

/// Estado de listagem de locais com sucesso.
final class SalasSuccess extends GenericState {
  /// {@macro locais_success}
  const SalasSuccess({
    required this.salas,
  });

  /// Lista de locais.
  final List<Sala> salas;

  @override
  List<Object> get props => [salas];
}

/// Estado de listagem de movimentações com sucesso.
final class MovimentacoesSuccess extends GenericState {
  /// {@macro movimentacoes_success}
  const MovimentacoesSuccess({
    required this.movimentacoes,
  });

  /// Lista de movimentações.
  final List<Movimentacao> movimentacoes;

  @override
  List<Object> get props => [movimentacoes];
}
