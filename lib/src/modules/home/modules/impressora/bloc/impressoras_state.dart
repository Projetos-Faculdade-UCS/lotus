part of 'impressoras_bloc.dart';

/// {@template impressoras_state}
/// Estados relacionados a impressoras.
/// {@endtemplate}
sealed class ImpressorasState extends Equatable {
  const ImpressorasState();

  @override
  List<Object> get props => [];
}

/// Estado inicial da tela de impressoras.
final class ImpressorasInitial extends ImpressorasState {}

/// Estado de carregamento da lista de impressoras.
final class ImpressorasLoading extends ImpressorasState {}

/// {@template impressoras_success}
/// Estado de sucesso ao carregar a lista de impressoras.
/// {@endtemplate}
final class ImpressorasSuccess extends ImpressorasState {
  /// {@macro impressoras_success}
  const ImpressorasSuccess(this.impressoras);

  /// Lista de impressoras.
  final List<Ativo> impressoras;

  @override
  List<Object> get props => [impressoras];
}

/// Estado de sucesso ao carregar uma impressora.
final class ImpressoraSuccess extends ImpressorasState {
  /// {@macro impressora_success}
  const ImpressoraSuccess(this.impressora);

  /// Impressora carregada.
  final Impressora impressora;

  @override
  List<Object> get props => [impressora];
}

/// Estado de erro ao carregar a lista de impressoras.
final class ImpressorasError extends ImpressorasState {}
