import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({
    required this.title,
    required this.value,
    this.width,
    this.leading,
    super.key,
  });

  final String title;

  final Widget value;

  final double? width;

  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      constraints: BoxConstraints(
        minHeight: 50,
        maxHeight: 100,
        maxWidth: width ?? double.infinity,
      ),
      child: ListTile(
        leading: leading,
        contentPadding: EdgeInsets.zero,
        title: AutoSizeText(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        subtitle: value,
      ),
    );
  }
}
