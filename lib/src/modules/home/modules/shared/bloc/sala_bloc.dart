import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/events.dart';
import 'package:lotus/src/modules/home/modules/shared/bloc/states.dart';
import 'package:repositories/repositories.dart';

class SalaBloc extends Bloc<GenericEvent, GenericState> {
  SalaBloc(this._salaRepository) : super(GenericInitial()) {
    on<GetAllSalas>(_onGetAllSalas);
  }

  final SalaRepository _salaRepository;

  FutureOr<void> _onGetAllSalas(
    GetAllSalas event,
    Emitter<GenericState> emit,
  ) async {
    emit(GenericLoading());
    try {
      final salas = await _salaRepository.fetchAll(event.nomeSala);
      emit(SalasSuccess(salas));
    } catch (e) {
      emit(GenericError());
    }
  }
}
