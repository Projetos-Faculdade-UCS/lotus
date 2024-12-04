import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

/// Search modal.
class SearchModal extends StatelessWidget {
  /// Default constructor.
  const SearchModal({
    super.key,
  });

  static const int _itemCount = 2000000;

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
          return const SearchModal(
            key: _modalKey,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                return Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(.9)),
                    borderRadius: BorderRadius.circular(10),
                    color: theme.scaffoldBackgroundColor,
                  ),
                  child: const _Content(
                    key: _contentKey,
                  ),
                );
              },
              placeholderBuilder: (context, size, widget) {
                return SizedBox(
                  width: size.width,
                  height: size.height,
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
                  );
                },
              ),
            ),
            Flexible(
              child: Material(
                color: Colors.transparent,
                child: SuperListView.builder(
                  padding: const EdgeInsets.all(8),
                  restorationId: 'search-list',
                  itemCount: _itemCount,
                  itemBuilder: (context, index) => ListTile(
                    key: ValueKey('search-list-item-$index'),
                    title: Text('Ativo ${index + 1}'),
                    leading: const Icon(HugeIcons.strokeRoundedComputer),
                  ),
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
