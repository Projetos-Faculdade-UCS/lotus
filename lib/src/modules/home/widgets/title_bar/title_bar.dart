import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/draggable_area.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/window_icons.dart';

/// Title bar widget.
class TitleBar extends StatelessWidget {
  /// Default constructor.
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            icon: const Icon(Icons.menu),
            hoverColor: Colors.grey.withOpacity(0.5),
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            onPressed: () {},
          ),
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'Project Lotus',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const DraggableArea(),
              ],
            ),
          ),
          const WindowIcons(),
        ],
      ),
    );
  }
}
