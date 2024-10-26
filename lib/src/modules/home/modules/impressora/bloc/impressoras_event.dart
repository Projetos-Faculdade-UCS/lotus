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
class ImpressorasFetch extends ImpressorasEvent {}
