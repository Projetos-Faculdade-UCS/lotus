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

  static final Widget _svg = Image.asset(
    'assets/logo/lotus_icon.png',
    cacheHeight: 512,
    cacheWidth: 512,
    isAntiAlias: true,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: size,
      child: _svg,
    );
  }
}
