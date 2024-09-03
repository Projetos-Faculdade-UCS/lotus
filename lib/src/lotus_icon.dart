import 'package:flutter/material.dart';

/// A widget that displays the Lotus icon.
class LotusIcon extends StatelessWidget {
  /// Creates a [LotusIcon].
  const LotusIcon({
    super.key,
    this.size = 24.0,
  });

  /// The size of the icon.
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo/lotus_icon.png',
      width: size,
      height: size,
    );
  }
}
