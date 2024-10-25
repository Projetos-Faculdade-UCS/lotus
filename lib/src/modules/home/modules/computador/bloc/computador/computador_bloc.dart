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
    on<ComputadorFetch>(_onFetch);
  }

  final ComputadorRepository _repository;

  Future<void> _onFetch(
    ComputadorFetch event,
    Emitter<ComputadorState> emit,
  ) async {
    emit(ComputadorLoading());
    final id = event.id;
    try {
      final computador = await _repository.getById(id);
      if (computador == null) {
        throw Exception('Computador não encontrado.');
      }
      emit(ComputadorSuccess(computador));
    } catch (e) {
      emit(ComputadorFailure());
    }
  }
}
