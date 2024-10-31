import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/draggable_area.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/menu/menu.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/search_bar/custom_search_bar.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/window_icons.dart';

/// Title bar widget.
class TitleBar extends StatelessWidget {
  /// Default constructor.
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.1),
      height: 36,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Menu(
            position: Offset(0, 36),
          ),
          Expanded(
            child: DraggableArea(),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: CustomSearchBar(),
            ),
          ),
          Expanded(
            child: DraggableArea(),
          ),
          WindowIcons(),
        ],
      ),
    );
  }
}
