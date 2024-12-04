import 'package:flutter/material.dart';
import 'package:lotus/src/modules/home/modules/shared/widgets/dotted_border.dart';

class NoContent extends StatelessWidget {
  const NoContent({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: DottedBorder(
        color: colorScheme.onSurfaceVariant,
        strokeWidth: 0.5,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}
