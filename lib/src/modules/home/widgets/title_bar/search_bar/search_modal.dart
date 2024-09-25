import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

/// Search modal.
class SearchModal extends StatelessWidget {
  /// Default constructor.
  const SearchModal({super.key});

  static const int _itemCount = 2000000;

  static const _modalKey = ValueKey('search-modal');

  /// Shows the search modal.
  static Future<void> show() {
    return Modular.to.push(
      PageRouteBuilder<void>(
        fullscreenDialog: true,
        opaque: false,
        barrierColor: Colors.black.withOpacity(0.5),
        barrierDismissible: true,
        barrierLabel: 'search-modal',
        settings: const RouteSettings(
          name: 'search-modal',
        ),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: const SearchModal(
              key: _modalKey,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        width: MediaQuery.of(context).size.width * .5,
        height: MediaQuery.of(context).size.height * .7,
        child: Column(
          children: [
            Hero(
              tag: 'search-bar',
              child: SearchBar(
                autoFocus: true,
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