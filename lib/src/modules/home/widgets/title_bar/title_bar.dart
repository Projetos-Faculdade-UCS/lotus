import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/draggable_area.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/window_icons.dart';

/// Title bar widget.
class TitleBar extends StatelessWidget {
  /// Default constructor.
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Padding(
          //   padding: EdgeInsets.all(8),
          //   child: Icon(
          //     Icons.menu,
          //     color: Colors.white,
          //   ),
          // ),
          Expanded(child: DraggableArea()),
          WindowIcons(),
        ],
      ),
    );
  }
}
