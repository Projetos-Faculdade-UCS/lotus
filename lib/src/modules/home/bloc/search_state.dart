part of 'search_bloc.dart';

/// {@template search_state}
/// Base class for search states.
/// {@endtemplate}
sealed class SearchState extends Equatable {
  /// {@macro search_state}
  const SearchState();

  @override
  List<Object> get props => [];
}

/// The initial state of the search bloc.
final class SearchInitial extends SearchState {}

/// The state of the search bloc when a search is in progress.
final class SearchInProgress extends SearchState {}

/// The state of the search bloc when a search has completed.
final class SearchSuccess extends SearchState {
  /// {@macro search_success}
  const SearchSuccess({
    required this.computadores,
    required this.impressoras,
    required this.monitores,
    this.exactPatrimonio,
  });

  /// The ativo that matches the patrimonio.
  final Ativo? exactPatrimonio;

  /// The list of computadores that match the search query.
  final List<Ativo> computadores;

  /// The list of impressoras that match the search query.
  final List<Ativo> impressoras;

  /// The list of monitores that match the search query.
  final List<Ativo> monitores;

  @override
  List<Object> get props => [
        if (exactPatrimonio != null) exactPatrimonio!,
        computadores,
        impressoras,
        monitores,
      ];
}

/// The state of the search bloc when a search has failed.
final class SearchFailure extends SearchState {}
