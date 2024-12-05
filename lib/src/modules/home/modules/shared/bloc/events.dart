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

/// Evento para buscar todas as movimentações de um computador.
class GetAllMovimentacoes extends GenericEvent {
  /// {@macro movimentacoes_get}
  const GetAllMovimentacoes(
    this.idComputador,
  );

  /// atributo que será utilizado para buscar as movimentações.
  final int idComputador;
}

/// Evento para buscar todos os ativos relacionados a um ativo.
class GetAtivosRelacionados extends GenericEvent {
  /// {@macro ativos_relacionados_get}
  const GetAtivosRelacionados(
    this.idAtivo,
  );

  /// atributo que será utilizado para buscar os ativos relacionados.
  final int idAtivo;
}
