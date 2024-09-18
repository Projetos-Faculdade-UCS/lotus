import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:window_manager/window_manager.dart';

/// Minimize button.
class MinimizeButton extends StatelessWidget {
  /// Default constructor.
  const MinimizeButton({super.key});

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
        HugeIcons.strokeRoundedMinusSign,
      ),
      hoverColor: Colors.grey.withOpacity(0.5),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.zero,
      onPressed: windowManager.minimize,
    );
  }
}
