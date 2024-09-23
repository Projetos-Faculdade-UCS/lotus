import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/hoverable_container.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/search_bar/search_modal.dart';

/// Search bar.
class CustomSearchBar extends StatelessWidget {
  /// Default constructor.
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'search-bar',
      child: HoverableContainer(
        onTap: SearchModal.show,
        decoration: WidgetStateProperty.resolveWith((states) {
          final borderOpacity = states.contains(WidgetState.hovered) ? .9 : .5;
          final scaffoldBackgroundColor =
              Theme.of(context).scaffoldBackgroundColor;
          final color = states.contains(WidgetState.hovered)
              ? scaffoldBackgroundColor.withAlpha(50)
              : scaffoldBackgroundColor;
          return BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(borderOpacity)),
            borderRadius: BorderRadius.circular(10),
            color: color,
          );
        }),
        child: const SizedBox.expand(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  HugeIcons.strokeRoundedSearch02,
                  size: 16,
                ),
              ),
              Text(
                'Buscar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
