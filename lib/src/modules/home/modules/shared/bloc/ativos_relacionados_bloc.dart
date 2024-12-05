import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/events.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/states.dart';
import 'package:repositories/repositories.dart';

/// Bloc responsável por gerenciar os ativos relacionados.
class AtivosRelacionadosBloc<T extends BaseAtivoRepository>
    extends Bloc<GenericEvent, GenericState> {
  /// {@macro ativos_relacionados_bloc}
  AtivosRelacionadosBloc(this._ativoRepository) : super(GenericInitial()) {
    on<GetAtivosRelacionados>(_onGetAtivosRelacionados);
  }

  /// Classe com as funcionalidades de conexão com a API.
  final T _ativoRepository;

  FutureOr<void> _onGetAtivosRelacionados(
    GetAtivosRelacionados event,
    Emitter<GenericState> emit,
  ) async {
    emit(GenericLoading());
    try {
      final ativos = await _ativoRepository.getRelacionados(event.idAtivo);
      emit(AtivosRelacionadosSuccess(ativos: ativos));
    } catch (e) {
      emit(GenericError());
    }
    return null;
  }
}
