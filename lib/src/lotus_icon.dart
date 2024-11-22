import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

/// A widget that displays the Lotus icon.
class LotusIcon extends StatelessWidget {
  /// Creates a [LotusIcon].
  const LotusIcon({
    super.key,
    this.size,
  });

  /// The size of the icon.
  final double? size;

  static const Widget _svg = SvgPicture(
    AssetBytesLoader('assets/logo/ucs-logo.svg.vec'),
  );

  @override
  Widget build(BuildContext context) {
    return _svg;
  }
}
