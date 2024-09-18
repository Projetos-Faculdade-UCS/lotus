import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/maximize_button.dart';
import 'package:lotus/src/modules/home/widgets/title_bar/minimize_button.dart';

/// Window icons widget.
class WindowIcons extends StatelessWidget {
  /// Default constructor.
  const WindowIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const MinimizeButton(),
        const MaximizeButton(),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // Close window.
          },
        ),
      ],
    );
  }
}
