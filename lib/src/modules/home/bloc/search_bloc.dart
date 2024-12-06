import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotus_api_client/lotus_api_client.dart';
import 'package:repositories/repositories.dart';

part 'search_event.dart';
part 'search_state.dart';

/// {@template search_bloc}
/// A [Bloc] which manages the search state.
/// {@endtemplate}
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  /// {@macro search_bloc}
  SearchBloc(
    this._computadorRepository,
    this._impressoraRepository,
    this._monitorRepository,
  ) : super(SearchInitial()) {
    on<Search>(_onSearch);
  }

  final ComputadorRepository _computadorRepository;

  final ImpressoraRepository _impressoraRepository;

  final MonitorRepository _monitorRepository;

  final Map<String, Map<String, CancelToken>> _cancelTokens = {
    'patrimonio': {
      'computador': CancelToken(),
      'impressora': CancelToken(),
      'monitor': CancelToken(),
    },
    'query': {
      'computador': CancelToken(),
      'impressora': CancelToken(),
      'monitor': CancelToken(),
    },
  };

  void _cancelAll() {
    for (final type in _cancelTokens.values) {
      for (final token in type.values) {
        if (!token.isCancelled) token.cancel();
      }
    }

    _cancelTokens['patrimonio']!['computador'] = CancelToken();
    _cancelTokens['patrimonio']!['impressora'] = CancelToken();
    _cancelTokens['patrimonio']!['monitor'] = CancelToken();
    _cancelTokens['query']!['computador'] = CancelToken();
    _cancelTokens['query']!['impressora'] = CancelToken();
    _cancelTokens['query']!['monitor'] = CancelToken();
  }

  FutureOr<void> _onSearch(Search event, Emitter<SearchState> emit) async {
    emit(SearchInProgress());

    _cancelAll();

    final computadores = await _computadorRepository.search(
      query: event.query,
      cancelToken: _cancelTokens['query']!['computador']!,
    );
    final impressoras = await _impressoraRepository.search(
      query: event.query,
      cancelToken: _cancelTokens['query']!['impressora']!,
    );
    final monitores = await _monitorRepository.search(
      query: event.query,
      cancelToken: _cancelTokens['query']!['monitor']!,
    );

    final computadoresPatrimonio = await _computadorRepository.search(
      patrimonio: event.query,
      cancelToken: _cancelTokens['patrimonio']!['computador']!,
    );
    final impressorasPatrimonio = await _impressoraRepository.search(
      patrimonio: event.query,
      cancelToken: _cancelTokens['patrimonio']!['impressora']!,
    );
    final monitoresPatrimonio = await _monitorRepository.search(
      patrimonio: event.query,
      cancelToken: _cancelTokens['patrimonio']!['monitor']!,
    );

    final exactPatrimonios = [
      ...computadoresPatrimonio,
      ...impressorasPatrimonio,
      ...monitoresPatrimonio,
    ];

    Ativo? exactPatrimonio;

    exactPatrimonio =
        exactPatrimonios.length == 1 ? exactPatrimonios.first : null;

    emit(
      SearchSuccess(
        computadores: computadores,
        impressoras: impressoras,
        monitores: monitores,
        exactPatrimonio: exactPatrimonio,
      ),
    );
  }
}
