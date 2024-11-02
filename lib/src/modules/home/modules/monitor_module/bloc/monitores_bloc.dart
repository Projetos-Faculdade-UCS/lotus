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
    on<GetAllMonitores>(_onGetAllMonitores);
    on<GetMonitor>(_onGetMonitor);
  }

  final MonitorRepository _monitorRepository;

  FutureOr<void> _onGetAllMonitores(
    GetAllMonitores event,
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

  FutureOr<void> _onGetMonitor(
    GetMonitor event,
    Emitter<MonitoresState> emit,
  ) async {
    emit(MonitoresLoading());
    final id = event.id;
    try {
      final monitor = await _monitorRepository.getById(id);
      if (monitor == null) {
        throw Exception('Monitor não encontrado.');
      }
      emit(MonitorSuccess(monitor));
    } catch (e) {
      emit(MonitoresError());
    }
  }
}
