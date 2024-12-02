import 'package:equatable/equatable.dart';

sealed class GenericEvent extends Equatable {
  const GenericEvent();

  @override
  List<Object> get props => [];
}

/// Evento para buscar todas as salas de acordo com o nome informado.
class GetAllSalas extends GenericEvent {
  /// {@macro salas_get}
  const GetAllSalas({
    this.nomeSala,
  });

  /// atributo que ser
  final String? nomeSala;
}
