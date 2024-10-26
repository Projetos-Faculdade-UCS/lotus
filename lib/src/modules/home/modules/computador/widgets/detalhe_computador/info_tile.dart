import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

/// {@template info_tile}
/// Tile que exibe informações.
/// {@endtemplate}
class InfoTile extends StatelessWidget {
  /// {@macro info_tile}
  const InfoTile({
    required this.title,
    required this.value,
    this.width,
    this.leading,
    super.key,
  });

  /// O título do tile.
  final String title;

  /// O valor do tile.
  final Widget value;

  /// A largura do tile.
  final double? width;

  /// O widget que será exibido à esquerda do tile.
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
