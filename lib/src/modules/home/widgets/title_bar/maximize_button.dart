import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:window_manager/window_manager.dart';

/// Maximize button.
class MaximizeButton extends StatelessWidget {
  /// Default constructor.
  const MaximizeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      icon: const Icon(
        HugeIcons.strokeRoundedSquare,
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      hoverColor: Colors.grey.withOpacity(0.5),
      onPressed: () async {
        final isMaximized = await windowManager.isMaximized();
        if (isMaximized) {
          await windowManager.unmaximize();
        } else {
          await windowManager.maximize();
        }
      },
    );
  }
}
