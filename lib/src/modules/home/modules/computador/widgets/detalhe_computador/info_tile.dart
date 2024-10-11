import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({
    required this.title,
    required this.value,
    this.icon,
    super.key,
  });

  final String title;

  final Widget value;

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final hasIcon = icon != null;
    return Row(
      children: [
        if (hasIcon)
          HugeIcon(
            icon: icon!,
            color: colorScheme.primary,
            size: 25,
          ),
        if (hasIcon) const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            value,
          ],
        ),
      ],
    );
  }
}
