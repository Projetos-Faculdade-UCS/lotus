part of 'search_bloc.dart';

/// {@template search_event}
/// Base class for search events.
/// {@endtemplate}
sealed class SearchEvent extends Equatable {
  /// {@macro search_event}
  const SearchEvent();

  @override
  List<Object> get props => [];
}

/// {@template search}
/// Notifies the bloc that the user has entered a query.
/// {@endtemplate}
class Search extends SearchEvent {
  /// {@macro search}
  const Search(this.query);

  /// The search query.
  final String query;

  @override
  List<Object> get props => [query];
}
