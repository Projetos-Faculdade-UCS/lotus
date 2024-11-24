part of 'pendentes_cubit.dart';

/// {@template pendentes_state}
/// State of the pending items.
/// {@endtemplate}
sealed class PendentesState extends Equatable {
  const PendentesState({
    required this.selectedIds,
  });

  /// List of selected items.
  final List<int> selectedIds;

  @override
  List<Object> get props => [selectedIds];
}

/// Initial state of the pending items.
final class PendentesInitial extends PendentesState {
  /// {@macro pendentes_state}
  PendentesInitial() : super(selectedIds: []);
}

/// State of the pending items.
final class SelectedIds extends PendentesState {
  /// {@macro pendentes_state}
  const SelectedIds({
    required super.selectedIds,
  });
}
