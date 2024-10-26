import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

part 'monitores_event.dart';
part 'monitores_state.dart';

/// {@template monitores_bloc}
/// Bloc responsável por gerenciar as monitores.
/// {@endtemplate}
class MonitoresBloc extends Bloc<MonitoresEvent, MonitoresState> {
  /// {@macro monitores_bloc}
  MonitoresBloc(this._monitorRepository) : super(MonitoresInitial()) {
    on<MonitoresFetch>(_onMonitoresFetch);
  }

  final MonitorRepository _monitorRepository;

  FutureOr<void> _onMonitoresFetch(
    MonitoresFetch event,
    Emitter<MonitoresState> emit,
  ) async {
    emit(MonitoresLoading());
    try {
      final monitores = await _monitorRepository.fetchAll();
      emit(MonitoresSuccess(monitores));
    } catch (e) {
      emit(MonitoresError());
    }
  }
}
