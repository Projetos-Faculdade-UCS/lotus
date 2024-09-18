import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

/// Close button.
class CloseButton extends StatelessWidget {
  /// Default constructor.
  const CloseButton({super.key});

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
        Icons.close,
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      hoverColor: Colors.red.withOpacity(0.5),
      onPressed: windowManager.close,
    );
  }
}
