import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

part 'impressoras_event.dart';
part 'impressoras_state.dart';

/// {@template impressoras_bloc}
/// Bloc responsável por gerenciar as impressoras.
/// {@endtemplate}
class ImpressorasBloc extends Bloc<ImpressorasEvent, ImpressorasState> {
  /// {@macro impressoras_bloc}
  ImpressorasBloc(this._impressoraRepository) : super(ImpressorasInitial()) {
    on<GetAllImpressoras>(_onGetAllImpressoras);
    on<GetImpressora>(_onGetImpressora);
  }

  final ImpressoraRepository _impressoraRepository;

  FutureOr<void> _onGetAllImpressoras(
    GetAllImpressoras event,
    Emitter<ImpressorasState> emit,
  ) async {
    emit(ImpressorasLoading());
    try {
      final impressoras = await _impressoraRepository.fetchAll();
      emit(ImpressorasSuccess(impressoras));
    } catch (e) {
      emit(ImpressorasError());
    }
  }

  FutureOr<void> _onGetImpressora(
    GetImpressora event,
    Emitter<ImpressorasState> emit,
  ) async {
    emit(ImpressorasLoading());
    try {
      final impressora = await _impressoraRepository.getById(event.id);
      if (impressora == null) {
        throw Exception('Impressora não encontrada.');
      }
      emit(ImpressoraSuccess(impressora));
    } catch (e) {
      emit(ImpressorasError());
    }
  }
}
