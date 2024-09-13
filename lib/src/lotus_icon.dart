import 'package:flutter/material.dart';

/// A widget that displays the Lotus icon.
class LotusIcon extends StatelessWidget {
  /// Creates a [LotusIcon].
  const LotusIcon({
    super.key,
    this.size,
  });

  /// The size of the icon.
  final double? size;

  static const AssetImage _iconImage = AssetImage('assets/logo/lotus_icon.png');

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Image(
        image: _iconImage,
        width: size,
        height: size,
      ),
    );
  }
}
