import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lotus/src/modules/home/widgets/example_context_menu.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/custom_search_bar.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/draggable_area.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/window_icons.dart';

/// Title bar widget.
class TitleBar extends StatelessWidget {
  /// Default constructor.
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey.withOpacity(0.1),
      child: SizedBox(
        height: 36,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ExampleContextMenu(
              child: IconButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                icon: const Icon(
                  HugeIcons.strokeRoundedMenu04,
                ),
                hoverColor: Colors.grey.withOpacity(0.5),
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
                onPressed: () {},
              ),
            ),
            const Expanded(
              child: DraggableArea(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: CustomSearchBar(),
            ),
            const Expanded(
              child: DraggableArea(),
            ),
            const WindowIcons(),
          ],
        ),
      ),
    );
  }
}
