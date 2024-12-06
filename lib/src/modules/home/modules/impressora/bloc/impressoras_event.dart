part of 'impressoras_bloc.dart';

/// {@template impressoras_event}
/// Eventos relacionados a impressoras.
/// {@endtemplate}
sealed class ImpressorasEvent extends Equatable {
  const ImpressorasEvent();

  @override
  List<Object> get props => [];
}

/// Evento para buscar as impressoras.
class GetAllImpressoras extends ImpressorasEvent {}

/// Evento para buscar uma impressora.
class GetImpressora extends ImpressorasEvent {
  /// {@macro impressoras_get}
  const GetImpressora(this.id);

  /// ID da impressora.
  final int id;
}

/// Evento para atualizar a sala de um ativo.
class UpdateSala extends ImpressorasEvent {
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
