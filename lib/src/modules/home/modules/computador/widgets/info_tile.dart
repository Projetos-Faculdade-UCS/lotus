import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({
    required this.title,
    required this.value,
    super.key,
    this.icon = HugeIcons.strokeRoundedUser,
  });

  final String title;

  final String value;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        HugeIcon(
          icon: HugeIcons.strokeRoundedUser,
          color: colorScheme.primary,
          size: 25,
        ),
        const SizedBox(width: 8),
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
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
