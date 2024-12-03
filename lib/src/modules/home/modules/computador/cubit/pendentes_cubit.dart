import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pendentes_state.dart';

/// {@template pendentes_cubit}
/// Cubit to manage the pending items.
/// {@endtemplate}
class PendentesCubit extends Cubit<PendentesState> {
  /// {@macro pendentes_cubit}
  PendentesCubit() : super(PendentesInitial());

  /// Selects an item.
  void select(int id) {
    final selectedIds = [...state.selectedIds, id];
    emit(SelectedIds(selectedIds: selectedIds));
  }

  /// Deselects an item.
  void deselect(int id) {
    final selectedIds = state.selectedIds.where((e) => e != id).toList();
    emit(SelectedIds(selectedIds: selectedIds));
  }

  /// Clears the selected items.
  void clear() {
    emit(PendentesInitial());
  }

  /// Selects all items.
  void selectAll(List<int> ids) {
    emit(SelectedIds(selectedIds: ids));
  }
}
