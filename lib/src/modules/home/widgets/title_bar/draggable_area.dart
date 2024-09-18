import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

/// A draggable area.
class DraggableArea extends StatelessWidget {
  /// A draggable area.
  const DraggableArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque, // Ensures the entire area is tappable
        onDoubleTap: () async {
          final isMaximized = await windowManager.isMaximized();
          if (isMaximized) {
            await windowManager.restore();
          } else {
            await windowManager.maximize();
          }
        },
        onPanStart: (details) {
          windowManager.startDragging();
        },
        child: Container(
          color: Colors
              .transparent, // Ensures the GestureDetector has a visible area
        ),
      ),
    );
  }
}
