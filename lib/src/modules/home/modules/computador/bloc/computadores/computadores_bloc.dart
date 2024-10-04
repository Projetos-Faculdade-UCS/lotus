import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

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

  // Replace StreamController with BehaviorSubject
  final _computadoresSubject = BehaviorSubject<List<Ativo>>();

  /// Exposes a stream of [Ativo] (computadores).
  Stream<List<Ativo>> get _computadoresStream => _computadoresSubject.stream;

  Future<void> _onFetch(
    ComputadoresFetch event,
    Emitter<ComputadoresState> emit,
  ) async {
    emit(ComputadoresLoading());
    try {
      final computadores = await _repository.fetchComputadores();
      _computadoresSubject.add(computadores);
      emit(ComputadoresSuccess(_computadoresStream));
    } catch (e) {
      emit(ComputadoresFailure());
    }
  }
}
