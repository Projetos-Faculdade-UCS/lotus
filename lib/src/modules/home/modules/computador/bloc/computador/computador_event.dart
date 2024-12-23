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

/// Evento para atualizar a sala de um ativo.
class UpdateSala extends ComputadorEvent {
  /// {@macro update_local}
  const UpdateSala({
    required this.id,
    required this.sala,
  });

  /// Id do ativo.
  final int id;

  /// Sala do ativo.
  final Sala? sala;
}

/// Evento para listar os computadores pendentes de validar.
final class FetchPendentes extends ComputadorEvent {}

/// Evento para selecionar um computador.
final class ValidateComputadores extends ComputadorEvent {
  /// {@macro validate_computadores}
  const ValidateComputadores(this.ids);

  /// Lista de IDs dos computadores.
  final List<int> ids;
}
