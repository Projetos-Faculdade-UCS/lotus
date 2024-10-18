import 'package:flutter/material.dart';
import 'package:lotus_ui/src/constants/colors.dart';

/// A set of extensions for the [Color] class.
extension type ColorExtension(Color color) {
  /// Returns a [MaterialColor] based on the [color].
  MaterialColor get materialColor {
    return createMaterialColor(color);
  }
}
