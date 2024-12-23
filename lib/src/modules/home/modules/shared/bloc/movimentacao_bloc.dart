import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/events.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/states.dart';
import 'package:repositories/repositories.dart';

/// {@template movimentacao_bloc}
/// Bloc responsável por gerenciar as movimentações de um ativo.
/// {@endtemplate}
class MovimentacaoBloc<T extends BaseAtivoRepository>
    extends Bloc<GenericEvent, GenericState> {
  /// {@macro movimentacao_bloc}
  MovimentacaoBloc(this._ativoRepository) : super(GenericInitial()) {
    on<GetAllMovimentacoes>(_onGetAllMovimentacoes);
  }

  /// Método que será chamado quando o evento [GetAllMovimentacoes] for disparado.
  final T _ativoRepository;

  FutureOr<void> _onGetAllMovimentacoes(
    GetAllMovimentacoes event,
    Emitter<GenericState> emit,
  ) async {
    emit(GenericLoading());
    try {
      final movimentacoes = await _ativoRepository.getHistoricoMovimentacoes(
        event.idComputador,
      );
      emit(MovimentacoesSuccess(movimentacoes: movimentacoes));
    } catch (e) {
      emit(GenericError());
    }
  }
}
