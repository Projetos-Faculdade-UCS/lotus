import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/bloc/search_bloc.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/search_bar/search_result.dart';

/// Search modal with debounced search functionality.
class SearchModal extends StatefulWidget {
  /// Default constructor.
  const SearchModal({
    required this.searchBloc,
    super.key,
  });

  /// The search bloc.
  final SearchBloc searchBloc;

  static const _modalKey = ValueKey('search-modal');

  static const _contentKey = ValueKey('search-content');

  /// Shows the search modal.
  static Future<void> show() async {
    await Future.delayed(const Duration(milliseconds: 100), () {});
    return Modular.to.push<void>(
      PageRouteBuilder<void>(
        fullscreenDialog: true,
        opaque: false,
        barrierColor: Colors.black38,
        barrierDismissible: true,
        barrierLabel: 'search-modal',
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        settings: const RouteSettings(
          name: 'search-modal',
        ),
        pageBuilder: (context, animation, secondaryAnimation) {
          return SearchModal(
            searchBloc: Modular.get(),
            key: _modalKey,
          );
        },
      ),
    );
  }

  @override
  State<SearchModal> createState() => _SearchModalState();
}

class _SearchModalState extends State<SearchModal> {
  /// Debounce duration in milliseconds
  static const _debounceDuration = Duration(milliseconds: 300);

  /// Timer to manage debounce
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    widget.searchBloc.add(const Search(''));
  }

  @override
  void dispose() {
    // Cancel the timer to prevent memory leaks
    _debounceTimer?.cancel();
    super.dispose();
  }

  /// Handles debounced search requests
  void _onSearchChanged(String value) {
    // Cancel any existing timer
    _debounceTimer?.cancel();

    // Create a new timer
    _debounceTimer = Timer(_debounceDuration, () {
      // Trigger search after the debounce duration
      widget.searchBloc.add(Search(value));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: Colors.grey.withOpacity(.4)),
        ),
        width: size.width * .5,
        height: size.height * .7,
        child: Column(
          children: [
            Hero(
              tag: 'search-bar',
              flightShuttleBuilder: (
                flightContext,
                animation,
                flightDirection,
                fromHeroContext,
                toHeroContext,
              ) {
                final borderRadiusFrom = BorderRadius.circular(10);

                const borderRadiusTo = BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                );

                final borderRadiusTween = BorderRadiusTween(
                  begin: borderRadiusFrom,
                  end: borderRadiusTo,
                );

                return Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(.9)),
                    borderRadius: borderRadiusTween.evaluate(animation),
                    color: theme.scaffoldBackgroundColor,
                  ),
                  child: const _Content(
                    key: SearchModal._contentKey,
                  ),
                );
              },
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SearchBar(
                    autoFocus: true,
                    constraints: BoxConstraints(
                      maxWidth: constraints.maxWidth,
                      minHeight: 40,
                    ),
                    elevation: const WidgetStatePropertyAll(0),
                    hintText: 'Buscar em todos os tipos de ativos',
                    hintStyle: const WidgetStatePropertyAll(
                      TextStyle(
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(.5),
                        ),
                      ),
                    ),
                    onChanged: _onSearchChanged,
                  );
                },
              ),
            ),
            Flexible(
              child: Material(
                color: Colors.transparent,
                child: BlocBuilder<SearchBloc, SearchState>(
                  bloc: widget.searchBloc,
                  builder: (context, state) {
                    if (state is SearchInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is SearchFailure) {
                      return const Center(
                        child: Text('Erro ao buscar ativos'),
                      );
                    }

                    if (state is! SearchSuccess) {
                      return const Center(
                        child: Text('Nenhum ativo encontrado'),
                      );
                    }

                    return SearchResult(
                      exactPatrimonio: state.exactPatrimonio,
                      computadores: state.computadores,
                      impressoras: state.impressoras,
                      monitores: state.monitores,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    // simulates a material's SearchBar
    return const Material(
      color: Colors.transparent,
      child: SearchBar(
        elevation: WidgetStatePropertyAll(0),
      ),
    );
  }
}
