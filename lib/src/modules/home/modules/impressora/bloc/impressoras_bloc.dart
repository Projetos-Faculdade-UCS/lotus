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
    on<ImpressorasFetch>(_onImpressorasFetch);
  }

  final ImpressoraRepository _impressoraRepository;

  FutureOr<void> _onImpressorasFetch(
    ImpressorasFetch event,
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
}
