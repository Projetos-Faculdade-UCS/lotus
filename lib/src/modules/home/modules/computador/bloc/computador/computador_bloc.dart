import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

part 'computador_event.dart';
part 'computador_state.dart';

/// {@template computadores_bloc}
/// Bloc para gerenciar a lista de computadores.
/// {@endtemplate}
class ComputadorBloc extends Bloc<ComputadorEvent, ComputadorState> {
  /// {@macro computadores_bloc}
  ComputadorBloc(this._repository) : super(ComputadorInitial()) {
    on<GetComputador>(_onGet);
    on<FetchComputadores>(_onFetch);
    on<UpdateSala>(_onUpdateSala);
  }

  final ComputadorRepository _repository;

  Future<void> _onGet(
    GetComputador event,
    Emitter<ComputadorState> emit,
  ) async {
    emit(ComputadorLoading());
    final id = event.id;
    try {
      final computador = await _repository.getById(id);
      if (computador == null) {
        throw Exception('Computador não encontrado.');
      }
      emit(GetComputadorSuccess(computador));
    } catch (e) {
      emit(ComputadorFailure());
    }
  }

  Future<void> _onFetch(
    FetchComputadores event,
    Emitter<ComputadorState> emit,
  ) async {
    emit(ComputadorLoading());
    try {
      final computadores = await _repository.fetchAll();
      emit(FetchComputadoresSuccess(computadores));
    } catch (e) {
      emit(ComputadorFailure());
    }
  }

  Future<void> _onUpdateSala(
    UpdateSala event,
    Emitter<ComputadorState> emit,
  ) async {
    emit(ComputadorLoading());
    final id = event.id;
    final sala = event.sala;
    try {
      final computador = await _repository.updateSala(id, sala.id);
      if (computador == null) {
        throw Exception('Falha ao atualizar a sala do computador.');
      }
      emit(GetComputadorSuccess(computador));
    } catch (e) {
      emit(ComputadorFailure());
    }
  }
}
