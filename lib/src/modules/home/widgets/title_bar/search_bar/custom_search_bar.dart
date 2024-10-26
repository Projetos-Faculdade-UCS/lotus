import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/hoverable_container.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/search_bar/search_modal.dart';

/// {@template custom_search_bar}
/// A custom search bar widget.
/// {@endtemplate}
class CustomSearchBar extends StatelessWidget {
  /// {@macro custom_search_bar}
  const CustomSearchBar({super.key, this.isTransitioning = false});

  /// Whether the search bar is transitioning.
  final bool isTransitioning;

  static const _contentKey = ValueKey('search-bar-content');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffoldBackgroundColor = theme.scaffoldBackgroundColor;

    return Hero(
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
            color: scaffoldBackgroundColor,
          ),
          child: const _Content(
            key: _contentKey,
          ),
        );
      },
      child: HoverableContainer(
        onTap: SearchModal.show,
        decoration: WidgetStateProperty.resolveWith(
          (states) {
            if (isTransitioning) {
              return const BoxDecoration(); // Simplified decoration
            }
            final borderOpacity =
                states.contains(WidgetState.hovered) ? .9 : .5;
            final color = states.contains(WidgetState.hovered)
                ? scaffoldBackgroundColor.withAlpha(50)
                : scaffoldBackgroundColor;
            return BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(borderOpacity)),
              borderRadius: BorderRadius.circular(10),
              color: color,
            );
          },
        ),
        child: const _Content(
          key: _contentKey,
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(HugeIcons.strokeRoundedSearch02, size: 16),
          ),
          Text(
            'Buscar',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
