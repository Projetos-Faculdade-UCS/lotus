part of 'monitores_bloc.dart';

/// {@template monitores_state}
/// Estados relacionados a monitores.
/// {@endtemplate}
sealed class MonitoresState extends Equatable {
  const MonitoresState();

  @override
  List<Object> get props => [];
}

/// Estado inicial da tela de monitores.
final class MonitoresInitial extends MonitoresState {}

/// Estado de carregamento da lista de monitores.
final class MonitoresLoading extends MonitoresState {}

/// {@template monitores_success}
/// Estado de sucesso ao carregar a lista de monitores.
/// {@endtemplate}
final class MonitoresSuccess extends MonitoresState {
  /// {@macro monitores_success}
  const MonitoresSuccess(this.monitores);

  /// Lista de monitores.
  final List<Ativo> monitores;

  @override
  List<Object> get props => [monitores];
}

/// Estado de sucesso ao carregar um monitor.
final class MonitorSuccess extends MonitoresState {
  /// {@macro monitor_success}
  const MonitorSuccess(this.monitor);

  /// Monitor carregado.
  final Ativo monitor;

  @override
  List<Object> get props => [monitor];
}

/// Estado de erro ao carregar a lista de monitores.
final class MonitoresError extends MonitoresState {}
