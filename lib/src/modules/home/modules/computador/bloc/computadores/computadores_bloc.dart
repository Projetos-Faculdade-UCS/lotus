import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

part 'computadores_event.dart';
part 'computadores_state.dart';

/// {@template computadores_bloc}
/// Bloc para gerenciar a lista de computadores.
/// {@endtemplate}
class ComputadoresBloc extends Bloc<ComputadoresEvent, ComputadoresState> {
  /// {@macro computadores_bloc}
  ComputadoresBloc(this._repository) : super(ComputadoresInitial()) {
    on<ComputadoresFetch>(_onFetch);
  }

  final ComputadorRepository _repository;

  Future<void> _onFetch(
    ComputadoresFetch event,
    Emitter<ComputadoresState> emit,
  ) async {
    emit(ComputadoresLoading());
    try {
      final computadores = await _repository.fetchAll();
      emit(ComputadoresSuccess(computadores));
    } catch (e) {
      emit(ComputadoresFailure());
    }
  }
}
