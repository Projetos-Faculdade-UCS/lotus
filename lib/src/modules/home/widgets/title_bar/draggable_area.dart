import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

/// A draggable area.
class DraggableArea extends StatelessWidget {
  /// A draggable area.
  const DraggableArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) async {
        if (event.buttons == kPrimaryButton) {
          await windowManager.startDragging();
        }
      },
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onDoubleTap: () async {
          final isMaximized = await windowManager.isMaximized();
          if (isMaximized) {
            await windowManager.unmaximize();
          } else {
            await windowManager.maximize();
          }
        },
        // No child needed since we're just capturing gestures
      ),
    );
  }
}
