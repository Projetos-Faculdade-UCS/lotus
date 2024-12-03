import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/events.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/states.dart';
import 'package:repositories/repositories.dart';

class MovimentacaoBloc extends Bloc<GenericEvent, GenericState> {
  MovimentacaoBloc(this._computadorRepository) : super(GenericInitial()) {
    on<GetAllMovimentacoes>(_onGetAllMovimentacoes);
  }

  /// Método que será chamado quando o evento [GetAllMovimentacoes] for disparado.
  final ComputadorRepository _computadorRepository;

  FutureOr<void> _onGetAllMovimentacoes(
    GetAllMovimentacoes event,
    Emitter<GenericState> emit,
  ) async {
    emit(GenericLoading());
    try {
      final movimentacoes =
          await _computadorRepository.getHistoricoMovimentacoes(
        event.idComputador,
      );
      emit(MovimentacoesSuccess(movimentacoes: movimentacoes));
    } catch (e) {
      emit(GenericError());
    }
  }
}
